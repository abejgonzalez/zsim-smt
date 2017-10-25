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

// Uncomment to enable stats
// #define SMT_STALL_STATS
// #define SMT_UOP_STATS

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

/** OOOE:
 * Context object container that holds BblInfo, 
 * loads and store addresses, and branch prediction variables (pc, taken, ntaken)
 */
class BblContext {
	public:
		BblContext() {
			branchTaken = false;
			branchPc = 0;
			branchTakenNpc = 0;
			branchNotTakenNpc = 0;
			bbl = nullptr;
			loads = 0;
			stores = 0;
			bblAddress = 0;
		}

		Address bblAddress; // bbl location
		BblInfo *bbl; // bbl object reference
		
		// Record load and store addresses
        Address loadAddrs[256], storeAddrs[256];
        uint32_t loads, stores;	// number of loads and stores
        
		// branch prediction
        bool branchTaken;
		Address branchPc;  // 0 if last bbl was not a conditional branch
        Address branchTakenNpc, branchNotTakenNpc;
}; 



template<uint32_t SZ>
class BblQueue {
	private:
		BblContext buf[SZ];
		uint32_t front;
		uint32_t rear;
		uint32_t num;
	public:
		pid_t pid; // process id
		bool older;

        BblQueue() {
			front = 0;
			rear = -1;
			num = 0;
			older = false;
			pid = 0;
        }

		inline uint32_t count(){
			return num;
		}

        inline bool back( BblContext** cntxt ){
			if ( this->empty() ){
				*cntxt = nullptr;
				return false;
			}

			*cntxt = &buf[ front ];
			return true;
        }

        inline bool push( BblContext** cntxt ){
			if ( this->full() ){
				*cntxt = nullptr;
				return false;
			}

			rear = ( rear + 1 ) % SZ;
			*cntxt = &buf[ rear ];
			num += 1;
			return true;
        }

		inline bool pop(){
			if ( this->empty() ){
				return false;
			}

			front = ( front + 1 ) % SZ;
			num -= 1;
			return true;
		}

		inline bool full(){
			if ( num == SZ )
				return true;
			else
				return false;
		}
		
		inline bool empty(){
			if ( num == 0 )
				return true;
			else
				return false;
		}
		
		inline void clear(){
			front = 0;
			rear = -1;
			num = 0;
		}
};


class Contention {
	public:
		uint64_t cache;
		uint64_t branchPrediction;
		uint64_t memory;

		Contention() {
			cache = 0;
			branchPrediction = 0;
			memory = 0;
		}
};

/** OOOE:
 * Container that holds 2 BblContext queues to store the core state.
 */
class SmtWindow {
	public:
		SmtWindow() {
			for( uint8_t i = 0; i < NUM_VCORES; ++i ){
				bblQueue[i].clear();
				uopIdx[i] = 0;
				prevContext[i] = nullptr;
				loadId[i] = storeId[i] = 0;
				cacheContention[i] = 0;
				contentionPid[i] = 0;
			}
			thCompleted = false;
		}

		static const uint8_t NUM_VCORES = 2;
		static const uint16_t QUEUE_SIZE = 5000;
		bool thCompleted;
		uint8_t vcore; // Current virtual core in use (used to access right queue)(vcore < numCores)
		BblQueue<QUEUE_SIZE> bblQueue[NUM_VCORES];
		uint32_t uopIdx[NUM_VCORES];
		BblContext* prevContext [NUM_VCORES];
		uint32_t loadId[NUM_VCORES];
		uint32_t storeId[NUM_VCORES];

		// tracks contention cycles.
		g_unordered_map<pid_t, Contention> contentionMap;
};

class SMTCore : public Core {
    private:
        FilterCache *l1i, *l1d;
		SmtWindow *smtWindow;
		lock_t windowLock;

		/* OOOE: Current bbl context that is filled with the simulator running. i
		 * Queued on the next bbl() function call. */
		// prevContextd used to append BblContext objects to the queues 
		//BblContext *curContext;
		BblContext *prevContext;

		// timing 
        uint64_t phaseEndCycle; //next stopping point
        uint64_t curCycle; //this model is issue-centric; curCycle refers to the current issue cycle
        uint64_t decodeCycle;

        CycleQueue<28> uopQueue;  // models issue queue
        uint64_t instrs, uops, bbls, approxInstrs;
        
		uint64_t regScoreboard[MAX_REGISTERS]; //contains timestamp of next issue cycles where each reg can be sourced
        uint64_t lastStoreCommitCycle;
        uint64_t lastStoreAddrCommitCycle; //tracks last store addr uop, all loads queue behind it

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
		uint64_t mispredBranches;

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

		// timing event recorder
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
		virtual void markDone();

        InstrFuncPtrs GetFuncPtrs();

        // Contention simulation interface
        EventRecorder* getEventRecorder();
		void cSimStart();
        void cSimEnd();

    private:
        // Predicated loads and stores call this function, gets recorded as a 0-cycle op.
        // Predication is rare enough that we don't need to model it perfectly to be accurate 
		// (i.e. the uops still execute, retire, etc), but this is needed for correctness.
        inline void predFalseMemOp();
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
        inline void branch(Address pc, bool taken, Address takenNpc, Address notTakenNpc);
        inline void assignPidArray(pid_t pid);

		/* OOOE: Functions to implement old Bbl() logic with interleaved instruction streams */
		// leave these functions uninlined for debugging purposes.
		void playback();
		bool getUop(uint8_t &curQ, DynUop ** uop, BblContext ** bblContext, bool &curBblSwap, uint8_t &curBblSwapQ);
        
		void runUop(uint8_t presQ, uint32_t &loadIdx, uint32_t &storeIdx, uint32_t prevDecCycle, uint64_t &lastCommitCycle, DynUop * uop, BblContext * bblContext);
		void runBblStatUpdate(uint8_t presQ, BblContext * bblContext);
		void runFrontend(uint8_t presQ, uint32_t &loadIdx, uint32_t &storeIdx, uint64_t &lastCommitCycle, BblContext * bblContext);

		/* OOOE: bbl analysis function. constructs a BblContext */
        void bbl(THREADID tid, Address bblAddr, BblInfo* bblInfo);

        static void LoadFunc(THREADID tid, ADDRINT addr);
        static void StoreFunc(THREADID tid, ADDRINT addr);
        static void PredLoadFunc(THREADID tid, ADDRINT addr, BOOL pred);
        static void PredStoreFunc(THREADID tid, ADDRINT addr, BOOL pred);
        static void BblFunc(THREADID tid, ADDRINT bblAddr, BblInfo* bblInfo);
        static void BranchFunc(THREADID tid, ADDRINT pc, BOOL taken, ADDRINT takenNpc, ADDRINT notTakenNpc);

} ATTR_LINE_ALIGNED;  // Take up an int number of cache lines
#endif  // SMT_CORE_H_
