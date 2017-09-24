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

// A composite core that simulates SMT.
// Controls access to two virtual OOO Cores in the background.

#include "smt_core.h"
#include <stdio.h>
#include <algorithm>
#include <queue>
#include <string>
#include "bithacks.h"
#include "g_std/g_multimap.h"
#include "memory_hierarchy.h"
#include "ooo_core_recorder.h"
#include "pad.h"

// Uncomment to enable stall stats
// #define OOO_STALL_STATS

class FilterCache;

struct BblInfo;

// class SMTCore : public Core {
//     private:
//         FilterCache* l1i;
//         FilterCache* l1d;
// 
// 		// timing 
//         uint64_t phaseEndCycle; //next stopping point
//         uint64_t curCycle; //this model is issue-centric; curCycle refers to the current issue cycle
//         uint32_t curCycleRFReads; //for RF read stalls
//         uint32_t curCycleIssuedUops; //for uop issue limits
// 
//         uint64_t decodeCycle;
//         CycleQueue<28> uopQueue;  // models issue queue
//         uint64_t instrs, uops, bbls, approxInstrs;
// 
//         BblInfo* prevBbl;
// 
//         //Record load and store addresses
//         Address loadAddrs[256];
//         Address storeAddrs[256];
//         uint32_t loads;
//         uint32_t stores;
// 
//         //LSU queues are modeled like the ROB. Surprising? Entries are grabbed in dataflow order,
//         //and for ordering purposes should leave in program order. In reality they are associative
//         //buffers, but we split the associative component from the limited-size modeling.
//         //NOTE: We do not model the 10-entry fill buffer here; the weave model should take care
//         //to not overlap more than 10 misses.
//         // ReorderBuffer<32, 4> loadQueue;
//         // ReorderBuffer<32, 4> storeQueue;
//         // ReorderBuffer<128, 4> rob;
// 
//         //This would be something like the Atom... (but careful, the iw probably does not allow 2-wide when configured with 1 slot)
//         //WindowStructure<1024, 1 /*size*/, 2 /*width*/> insWindow; //this would be something like an Atom, except all the instruction pairing business...
// 
//         //Nehalem
// 		// OOOE: could be pretty useful. 
// 		// 	may not have to reinvent the wheel for ins windows...
//         //WindowStructure<1024, 36 /*size*/> insWindow; 
// 		////NOTE: IW width is implicitly determined by the decoder, which sets the port masks according to uop type
// 
// 
// 		// OOOE: probably don't need this.
//         // Agner's guide says it's a 2-level pred and BHSR is 18 bits, so this is the config that makes sense;
//         // in practice, this is probably closer to the Pentium M's branch predictor, (see Uzelac and Milenkovic,
//         // ISPASS 2009), which get the 18 bits of history through a hybrid predictor (2-level + bimodal + loop)
//         // where a few of the 2-level history bits are in the tag.
//         // Since this is close enough, we'll leave it as is for now. Feel free to reverse-engineer the real thing...
//         // UPDATE: Now pht index is XOR-folded BSHR. This has 6656 bytes total -- not negligible, but not ridiculous.
//         // BranchPredictorPAg<11, 18, 14> branchPred;
// 		// uint32_t mispredBranches;
// 
//         // Address branchPc;  //0 if last bbl was not a conditional branch
//         // bool branchTaken;
//         // Address branchTakenNpc;
//         // Address branchNotTakenNpc;
// 
// 
// 		#ifdef SMT_STALL_STATS
//         	Counter profFetchStalls, profDecodeStalls, profIssueStalls;
// 		#endif
// 
//         // Load-store forwarding
//         // Just a direct-mapped array of last store cycles to 4B-wide blocks
//         // (i.e., indexed by (addr >> 2) & (FWD_ENTRIES-1))
//         struct FwdEntry {
//             Address addr;
//             uint64_t storeCycle;
//             void set(Address a, uint64_t c) {addr = a; storeCycle = c;}
//         };
// 
//         #define FWD_ENTRIES 32  // 2 lines, 16 4B entries/line
//         FwdEntry fwdArray[FWD_ENTRIES];
// 
// 		// OOOE: may have to create our own recorder.
//         // OOOCoreRecorder cRec;
// }

/** public: */


SMTCore::SMTCore(FilterCache* _l1i, FilterCache* _l1d, g_string& _name)
	: Core(_name), l1i(_l1i), l1d(_l1d)/*, cRec(0, _name) */ {

    info("OOOE: Creating a SMT Core");
    OOOCore *oooCoreMem = gm_memalign < OOOCore > (CACHE_LINE_BYTES, 2);
    
    g_string vc1Name = _name.append("VCore_1");
    g_string vc2Name = _name.append("VCore_2");
    vcore1 = new(&oooCoreMem[0]) OOOCore(_l1i, _l1d, vc1Name);
    vcore2 = new(&oooCoreMem[1]) OOOCore(_l1i, _l1d, vc2Name);
}

void SMTCore::initStats(AggregateStat* parentStat) {
    info("OOOE: initStates()");
}

uint64_t SMTCore::getInstrs() const {
	return instrs;
}
uint64_t SMTCore::getPhaseCycles() const {
	return phaseEndCycle;
}
uint64_t SMTCore::getCycles() const {
	// old way. TODO: revise for SMT.
	// return cRec.getUnhaltedCycles(curCycle);
	return curCycle;
}

void SMTCore::contextSwitch(int32_t gid) {
    info("OOOE: contextSwitch()");
}

void SMTCore::join() {
    info("OOOE: join()");
}

void SMTCore::leave() {
    info("OOOE: leave()");
}

InstrFuncPtrs SMTCore::GetFuncPtrs() {
	return {
		LoadFunc, StoreFunc, 
		BblFunc, BranchFunc, 
		PredLoadFunc, PredStoreFunc, 
		FPTR_ANALYSIS, {0}
	};
}

// Contention simulation interface
EventRecorder* SMTCore::getEventRecorder() {
	// OOOE: should we create a new event recorder?
	// return cRec.getEventRecorder();
	return vcore1->getEventRecorder();
}
void SMTCore::cSimStart(){
    info("OOOE: cSimStart()");
}

void SMTCore::cSimEnd() {
    info("OOOE: cSimEnd()");
}

/** private: */

inline void SMTCore::load(Address addr) {
    info("OOOE: load");
}

inline void SMTCore::store(Address addr) {
    info("OOOE: store");
}

/* NOTE: Analysis routines cannot touch curCycle directly, must use
 * advance() for long jumps or insWindow.advancePos() for 1-cycle
 * jumps.
 *
 * UPDATE: With decodeCycle, this difference is more serious. ONLY
 * cSimStart and cSimEnd should call advance(). advance() is now meant
 * to advance the cycle counters in the whole core in lockstep.
 */
inline void SMTCore::advance(uint64_t targetCycle) {
    info("OOOE: advance");
}

// Predicated loads and stores call this function, gets recorded as a 0-cycle op.
// Predication is rare enough that we don't need to model it perfectly to be accurate 
// (i.e. the uops still execute, retire, etc), but this is needed for correctness.
inline void SMTCore::predFalseMemOp() {
    info("OOOE: predFalseMemOp");
}


/** fPtrs Core Analysis functions. */

inline void SMTCore::branch(Address pc, bool taken, Address takenNpc, Address notTakenNpc) {
    info("OOOE: branch");
}

inline void SMTCore::bbl(Address bblAddr, BblInfo* bblInfo) {
    info("OOOE: bbl");
}
void SMTCore::LoadFunc(THREADID tid, ADDRINT addr) {
    info("OOOE: loadfunc");
}
void SMTCore::StoreFunc(THREADID tid, ADDRINT addr) {
    info("OOOE: storefunc");
}
void SMTCore::PredLoadFunc(THREADID tid, ADDRINT addr, BOOL pred) {
    info("OOOE: predloadfunc");
}
void SMTCore::PredStoreFunc(THREADID tid, ADDRINT addr, BOOL pred) {
    info("OOOE: PRedstorfuc");
}
void SMTCore::BblFunc(THREADID tid, ADDRINT bblAddr, BblInfo* bblInfo) {
	info ("OOOE: BblFunc");
}
void SMTCore::BranchFunc(THREADID tid, ADDRINT pc, BOOL taken, ADDRINT takenNpc, ADDRINT notTakenNpc) {
    info("OOOE: branchFunc");
}

