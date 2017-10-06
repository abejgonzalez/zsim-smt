/** $lic$
 * Copyright (C) 2012-2015 by Massachusetts Institute of Technology
 * Copyright (C) 2010-2013 by The Board of Trustees of Stanford University
 *
 * This file is part of zsim.
 *
 * zsim is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, version 2.
 *
 * If you use this software in your research, we request that you reference
 * the zsim paper ("ZSim: Fast and Accurate Microarchitectural Simulation of
 * Thousand-Core Systems", Sanchez and Kozyrakis, ISCA-40, June 2013) as the
 * source of the simulator in any publications that use this software, and that
 * you send us a citation of your work.
 *
 * zsim is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef SMT_CORE_H_
#define SMT_CORE_H_

// A composite core that simulates SMT.
// Controls access to two virtual OOO Cores in the background.

#include <algorithm>
#include <queue>
#include <string>
#include <unistd.h>
#include "core.h"
#include "g_std/g_multimap.h"
#include "memory_hierarchy.h"
#include "ooo_core_recorder.h"
#include "ooo_core.h"
#include "pad.h"

// Uncomment to enable stall stats
// #define SMT_STALL_STATS

/** OOOE:
 * Description: Context object container that holds BblInfo, loads and store addresses,
 * branch prediction variables (pc, taken, ntaken)
 */
class BblContext {
	public:
		pid_t pid;
		Address bblAddress;
		BblInfo *bbl; // TODO: may have to deep copy this struct. 
		// instructions refered to internally may have been deleted before playback time.
		
		// Record load and store addresses
		/* TODO: Are we assuming that there WON'T be over 256 loads and stores in a bbl? */
        Address loadAddrs[256], storeAddrs[256];
        uint32_t loads, stores;	// current loadAddrs and storeAddrs indexes
        
		// branch prediction
        bool branchTaken;
		Address branchPc;  //0 if last bbl was not a conditional branch
        Address branchTakenNpc, branchNotTakenNpc;
}; 

/** OOOE:
 * Description: Container that holds 2 BblContext queues to store the core
 * state.
 */
class SmtWindow {
	public:
		static const uint8_t NUM_VCORES = 2;
		static const uint16_t QUEUE_SIZE = 5000;
		uint8_t vcore; // Current virtual core in use (used to access right queue)(vcore < numCores)
		uint16_t numContexts[NUM_VCORES];
		/* TODO: Look into this src/g_std/g_vector.h, seems to inherit from vector and use the heap memory that
		 * was globally allocated */
		//g_vector< g_vector<BblContext> > queue;
		BblContext queue[NUM_VCORES][QUEUE_SIZE];

		SmtWindow() { for(uint8_t i = 0; i < NUM_VCORES; ++i) numContexts[i] = 0; }
};

class SMTCore : public Core {
    private:
        FilterCache* l1i;
        FilterCache* l1d;

		// shared objects
		SmtWindow *smtWindow;
		lock_t windowLock;

		// timing 
        uint64_t phaseEndCycle; //next stopping point
        uint64_t curCycle; //this model is issue-centric; curCycle refers to the current issue cycle

        uint64_t decodeCycle;
        CycleQueue<28> uopQueue;  // models issue queue
        uint64_t instrs, uops, bbls, approxInstrs;
        
		uint64_t regScoreboard[MAX_REGISTERS]; //contains timestamp of next issue cycles where each reg can be sourced
        uint64_t lastStoreCommitCycle;
        uint64_t lastStoreAddrCommitCycle; //tracks last store addr uop, all loads queue behind it

    
        /* OOOE: Current bbl context that is filled with the simulator running. Queued on the 
           next bbl() function call. */
		BblContext *curContext = NULL;
        

        //LSU queues are modeled like the ROB. Surprising? Entries are grabbed in dataflow order,
        //and for ordering purposes should leave in program order. In reality they are associative
        //buffers, but we split the associative component from the limited-size modeling.
        //NOTE: We do not model the 10-entry fill buffer here; the weave model should take care
        //to not overlap more than 10 misses.
        ReorderBuffer<32, 4> loadQueue;
        ReorderBuffer<32, 4> storeQueue;
        ReorderBuffer<128, 4> rob;
        uint32_t curCycleRFReads; //for RF read stalls
        uint32_t curCycleIssuedUops; //for uop issue limits

        //This would be something like the Atom... (but careful, the iw probably does not allow 2-wide when configured with 1 slot)
        // WindowStructure<1024, 1 /*size*/, 2 /*width*/> insWindow; //this would be something like an Atom, except all the instruction pairing business...

        //Nehalem
		// OOOE: could be pretty useful. 
		// 	may not have to reinvent the wheel for ins windows...
        WindowStructure<1024, 36 /*size*/> insWindow; 
		////NOTE: IW width is implicitly determined by the decoder, which sets the port masks according to uop type


		// OOOE: probably don't need this.
        // Agner's guide says it's a 2-level pred and BHSR is 18 bits, so this is the config that makes sense;
        // in practice, this is probably closer to the Pentium M's branch predictor, (see Uzelac and Milenkovic,
        // ISPASS 2009), which get the 18 bits of history through a hybrid predictor (2-level + bimodal + loop)
        // where a few of the 2-level history bits are in the tag.
        // Since this is close enough, we'll leave it as is for now. Feel free to reverse-engineer the real thing...
        // UPDATE: Now pht index is XOR-folded BSHR. This has 6656 bytes total -- not negligible, but not ridiculous.
        BranchPredictorPAg<11, 18, 14> branchPred;
		uint32_t mispredBranches;



		#ifdef SMT_STALL_STATS
        	Counter profFetchStalls, profDecodeStalls, profIssueStalls;
		#endif

        // Load-store forwarding
        // Just a direct-mapped array of last store cycles to 4B-wide blocks
        // (i.e., indexed by (addr >> 2) & (FWD_ENTRIES-1))
        struct FwdEntry {
            Address addr;
            uint64_t storeCycle;
            void set(Address a, uint64_t c) {addr = a; storeCycle = c;}
        };

        #define FWD_ENTRIES 32  // 2 lines, 16 4B entries/line
        FwdEntry fwdArray[FWD_ENTRIES];

		// OOOE: may have to create our own recorder.
        OOOCoreRecorder cRec;

    public:
        SMTCore(FilterCache* _l1i, FilterCache* _l1d, g_string& _name);

        void initStats(AggregateStat* parentStat);

        uint64_t getInstrs() const;
        uint64_t getPhaseCycles() const;
        uint64_t getCycles() const; 

        void contextSwitch(int32_t gid);

        virtual void join();
        virtual void leave();

        InstrFuncPtrs GetFuncPtrs();

        // Contention simulation interface
        EventRecorder* getEventRecorder();
		void cSimStart();
        void cSimEnd();

    private:
        inline void load(Address addr);
        inline void store(Address addr);

        /* NOTE: Analysis routines cannot touch curCycle directly, must use
         * advance() for long jumps or insWindow.advancePos() for 1-cycle
         * jumps.
         *
         * UPDATE: With decodeCycle, this difference is more serious. ONLY
         * cSimStart and cSimEnd should call advance(). advance() is now meant
         * to advance the cycle counters in the whole core in lockstep.
         */
        inline void advance(uint64_t targetCycle);

		/* OOOE: Functions to implement old Bbl() logic with interleaved instruction streams */
		inline void playback();
		inline bool getUop(uint8_t& curQ, uint32_t (&curContext)[2], uint64_t (&curUop)[2], DynUop** uop, BblContext** bblContext, uint8_t& curBblSwap);
        inline void runUop(uint32_t& loadIdx, uint32_t& storeIdx, uint32_t prevDecCycle, uint64_t& lastCommitCycle, DynUop* uop, BblContext* bblContext);
		inline void runBblStatUpdate(BblContext* bblContext);
		inline void runFrontend(uint32_t& loadIdx, uint32_t& storeIdx, uint64_t& lastCommitCycle, BblContext* bblContext);

        // Predicated loads and stores call this function, gets recorded as a 0-cycle op.
        // Predication is rare enough that we don't need to model it perfectly to be accurate 
		// (i.e. the uops still execute, retire, etc), but this is needed for correctness.
        inline void predFalseMemOp();

        inline void branch(Address pc, bool taken, Address takenNpc, Address notTakenNpc);

		/* OOOE: TODO: Make inline / Check if you need 2 funcs */
        void bbl(THREADID tid, Address bblAddr, BblInfo* bblInfo);
		inline void bbl(Address bblAddr, BblInfo* bblInfo);

        static void LoadFunc(THREADID tid, ADDRINT addr);
        static void StoreFunc(THREADID tid, ADDRINT addr);
        static void PredLoadFunc(THREADID tid, ADDRINT addr, BOOL pred);
        static void PredStoreFunc(THREADID tid, ADDRINT addr, BOOL pred);
        static void BblFunc(THREADID tid, ADDRINT bblAddr, BblInfo* bblInfo);
        static void BranchFunc(THREADID tid, ADDRINT pc, BOOL taken, ADDRINT takenNpc, ADDRINT notTakenNpc);
} ATTR_LINE_ALIGNED;  // Take up an int number of cache lines

#endif  // SMT_CORE_H_
