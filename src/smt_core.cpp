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
#include "zsim.h"

// Uncomment to enable stall stats
// #define OOO_STALL_STATS
extern GlobSimInfo* zinfo;

SMTCore::SMTCore(FilterCache* _l1i, FilterCache* _l1d, g_string& _name)
	: Core(_name), l1i(_l1i), l1d(_l1d), cRec(0, _name) {

    info("OOOE: Creating a SMT Core");
	curCycle = 0;
    
	SmtWindow *smtWindowMem = gm_memalign< SmtWindow >(CACHE_LINE_BYTES, 1);
	smtWindow = new(&smtWindowMem[0]) SmtWindow();
	smtWindow->vcore = 0;
	futex_init(&windowLock);
}

void SMTCore::initStats(AggregateStat* parentStat) {
    info("OOOE: initStates()");
}

uint64_t SMTCore::getInstrs() const {
	return instrs;
}
uint64_t SMTCore::getPhaseCycles() const {
	return curCycle % zinfo->phaseLength;
}
uint64_t SMTCore::getCycles() const {
	// old way. TODO: revise for SMT.
	return cRec.getUnhaltedCycles(curCycle);
}

void SMTCore::contextSwitch(int32_t gid) {
    info("OOOE: contextSwitch(%d)", getpid());
	
	/* OOOE: Run from scheduler. gid = -1 is passed from scheduler in the
	   deschedule function. */
	if (gid == -1) { 
		smtWindow->vcore = (smtWindow->vcore + 1) % SmtWindow::NUM_VCORES;
		if (smtWindow->vcore == 0) {
			// TODO: playback previous vcore queues.
			this->playback();
		}

		// Old OOO_CORE code
        // Do not execute previous BBL, as we were context-switched
        // prevBbl = nullptr;
        // Invalidate virtually-addressed filter caches
        /* OOOE: AG: We dont want to clear the cache since they are shared */
        // l1i->contextSwitch();
        // l1d->contextSwitch();
    }

}

/**
 * TODO:
 * What is a join? 
 * Is this called by the scheduler?
 * Can we update the virtual core number here?
 */
void SMTCore::join() {
    info("OOOE: join()");
	info("[%s] Joining, curCycle %ld phaseEnd %ld", name.c_str(), curCycle, phaseEndCycle);
    uint64_t targetCycle = cRec.notifyJoin(curCycle);
    if (targetCycle > curCycle) advance(targetCycle);
    phaseEndCycle = zinfo->globPhaseCycles + zinfo->phaseLength; // OOOE: possibly the global cycle count.
    // assert(targetCycle <= phaseEndCycle);
    info("[%s] Joined, curCycle %ld phaseEnd %ld", name.c_str(), curCycle, phaseEndCycle);
}

/**
 * TODO:
 * What is a leave? 
 * Is this called by the scheduler?
 * Can we update the virtual core number here?
 */
void SMTCore::leave() {
    info("OOOE: leave()");
    info("[%s] Leaving, curCycle %ld phaseEnd %ld", name.c_str(), curCycle, phaseEndCycle);
    cRec.notifyLeave(curCycle);
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
	return cRec.getEventRecorder();
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
    if(curContext)
        curContext->loadAddrs[curContext->loads++] = addr;
}

inline void SMTCore::store(Address addr) {
    info("OOOE: store");
    if(curContext)
        curContext->storeAddrs[curContext->stores++] = addr;
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
    // I'm going to go out on a limb and assume just loads are predicated 
	// (this will not fail silently if it's a store)
	if(curContext)
        curContext->loadAddrs[curContext->loads++] = -1L;
}


/** fPtrs Core Analysis functions. */

inline void SMTCore::branch(Address pc, bool taken, Address takenNpc, Address notTakenNpc) {
    info("OOOE: branch");
	if(curContext) {
		curContext->branchPc = pc;
		curContext->branchTaken = taken;
		curContext->branchTakenNpc = takenNpc;
		curContext->branchNotTakenNpc = notTakenNpc;
	}
}

// TODO: reimplement the original bbl func algorithm in playback()
inline void SMTCore::bbl(Address bblAddr, BblInfo* bblInfo) {
	/* OOOE: If the queue is full then "flush" (running the bbls) in sudo-lockstep */
	if( smtWindow->numContexts[ smtWindow->vcore ] == ( SmtWindow::QUEUE_SIZE - 1 ) ) 
		this->playback();
	
	/* Store the bbl within a new context that fits in the queue */
	futex_lock(&windowLock);
	int vcore = smtWindow->vcore;
	int contextNum = smtWindow->numContexts[vcore]++;
	
	info("OOOE: bbl  vcore: %d, contextNum: %d", vcore, contextNum);
	curContext = new(&(smtWindow->queue[vcore][contextNum])) BblContext();		
	curContext->pid = getpid();
	curContext->bbl = bblInfo;
	curContext->bblAddress = bblAddr;
	curContext->loads = curContext->stores = 0;
	futex_unlock(&windowLock);
}

void SMTCore::LoadFunc(THREADID tid, ADDRINT addr) {
    info("OOOE: loadfunc");
	static_cast<SMTCore*>(cores[tid])->load(addr);
}
void SMTCore::StoreFunc(THREADID tid, ADDRINT addr) {
    info("OOOE: storefunc");
	static_cast<SMTCore*>(cores[tid])->store(addr);
}
void SMTCore::PredLoadFunc(THREADID tid, ADDRINT addr, BOOL pred) {
    info("OOOE: predloadfunc");
    SMTCore* core = static_cast<SMTCore*>(cores[tid]);
    if (pred) core->load(addr);
    else core->predFalseMemOp();
}
void SMTCore::PredStoreFunc(THREADID tid, ADDRINT addr, BOOL pred) {
    info("OOOE: predstorfuc");
    SMTCore* core = static_cast<SMTCore*>(cores[tid]);
    if (pred) core->store(addr);
    else core->predFalseMemOp();
}
void SMTCore::BblFunc(THREADID tid, ADDRINT bblAddr, BblInfo* bblInfo) {
	info ("OOOE: BblFunc");
    static_cast<SMTCore*>(cores[tid])->bbl(bblAddr, bblInfo);
	//	while (core->curCycle > core->phaseEndCycle) {
	//        core->phaseEndCycle += zinfo->phaseLength;
	//
	//        uint32_t cid = getCid(tid);
	//        // NOTE: TakeBarrier may take ownership of the core, and so it will be used by some other thread. If TakeBarrier context-switches us,
	//        // the *only* safe option is to return inmmediately after we detect this, or we can race and corrupt core state. However, the information
	//        // here is insufficient to do that, so we could wind up double-counting phases.
	//        uint32_t newCid = TakeBarrier(tid, cid);
	//        // NOTE: Upon further observation, we cannot race if newCid == cid, so this code should be enough.
	//        // It may happen that we had an intervening context-switch and we are now back to the same core.
	//        // This is fine, since the loop looks at core values directly and there are no locals involved,
	//        // so we should just advance as needed and move on.
	//        if (newCid != cid) break;  /*context-switch, we do not own this context anymore*/
	//    }
}
void SMTCore::BranchFunc(THREADID tid, ADDRINT pc, BOOL taken, ADDRINT takenNpc, ADDRINT notTakenNpc) {
    info("OOOE: branchFunc");
    static_cast<SMTCore*>(cores[tid])->branch(pc, taken, takenNpc, notTakenNpc);
}


/**
 * TODO: Implement instruction window playback.
 */
void SMTCore::playback() {
    info("OOOE: playback(%d) curCycle: %lu", getpid(), curCycle);
	futex_lock(&windowLock);

    /* OOOE: Free resources but you also want to run both bbls and start to
       analyze the intersection of the two */

    /* Algo Design 
       getUop( choose between uop from 1st q or 2nd q )
       while (return vals of getUop return true for at least 1 )
         run uop
     */
    DynUop* uop;
    bool uopPresent = getUop(uop);

    while (uopPresent){
        /* Run the uop here similar to bbl() */
        assern (uop != null);
        curCycle += 1;

        /* Get new uop to run */
        uopPresent = getUop(uop);
    }

        

        

        
    /* OOOE: RM/JN: Run through all bbls starting with 1 q then going to the other */
	for(int i = 0; i < SmtWindow::NUM_VCORES; ++i) {
		for(int j = 0; j < smtWindow->numContexts[i]; ++j) {
			// TODO: fill in playback algorithm
			/* OOOE: TODO: Have both instructions run in lockstep within a bbl */
    		DynBbl* bbl = &(smtWindow->queue[i][j].bbl->oooBbl[0]);
			for (uint32_t i = 0; i < bbl->uops; i++) {
        		DynUop* uop = &(bbl->uop[i]);
				assert (uop != NULL);
				curCycle += 1; 			
			}
			// delete smtWindow->queue[i][j].bbl; // may be a bad idea to free this memory...
		}
		smtWindow->numContexts[i] = 0;
	} 
	
	futex_unlock(&windowLock);
    info("OOOE: playback(%d) updated curCycle: %lu", getpid(), curCycle);
}

bool SMTCore::getUop(DynUop* uop){
    static char curQ = 0;
    static uint32_t curContext[2] = {0,0};
    static uint64_t curUop[2] = {0,0};

    /* Choose what Q to read from */
    // maybe arbitration function here

}


