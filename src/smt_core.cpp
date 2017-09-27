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
    if(curContext){
        curContext->loadAddrs[curContext->loads++] = addr;
    }
}

inline void SMTCore::store(Address addr) {
    info("OOOE: store");
    if(curContext){
        curContext->storeAddrs[curContext->stores++] = addr;
    }
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
	if(curContext){
        curContext->loadAddrs[curContext->loads++] = -1L;
    }
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

    DynUop* uop;
	BblContext* bblContext;
    uint8_t curQ = 1;
    uint32_t curContext[2] = {0,0};
    uint64_t curUop[2] = {0,0};
    bool uopPresent = getUop(curQ, curContext, curUop, &uop, &bblContext);

    while (uopPresent){
        /* Run the uop here similar to bbl() */
        assert (uop != nullptr);
        curCycle += 1;

        /* Get new uop to run */
        uopPresent = getUop(curQ, curContext, curUop, &uop, &bblContext);
    }
	
	// smtWindow->numContexts[0] = 0;
	// smtWindow->numContexts[1] = 0;

	futex_unlock(&windowLock);
    info("OOOE: playback(%d) updated curCycle: %lu", getpid(), curCycle);
}

/* OOOE: getUop()
 * Description: Function to get a specific UOP and BblContext object to run in playback()
 * Input: A DynUop and BblContext reference (Do not want a copy of them)
 * Output: Bool telling whether a UOP was retrieved (Only would happen in the case both Q's are empty)
 */
inline bool SMTCore::getUop(uint8_t& curQ, uint32_t (&curContext)[2], uint64_t (&curUop)[2], DynUop** uop, BblContext** bblContext){
	/* OOOE: Arbitration section: The UOP chosen is based on the core state, etc */
	if(smtWindow->numContexts[1 - curQ] > 0) {
		curQ = curQ ? 0 : 1; 
	}
	/* OOOE: End: Arbitration section */

    /* OOOE: Determine if there is a valid context to read in the Q */
	if ( curContext[curQ] < smtWindow->numContexts[curQ] ){
		BblContext& cntxt = smtWindow->queue[curQ][curContext[curQ]];

		/* OOOE: TODO: Should there be a check to see if oooBbl != NULL? */
		/* OOOE: TODO: Should UOP's be present? oooBbl[0].uops > 0 */
		/* OOOE: Determine if a UOP is present */
		assert (cntxt.bbl->oooBbl != nullptr);
		if ( curUop[curQ] < cntxt.bbl->oooBbl[0].uops ){
			/* fetch uop from current queue, current basic block. */
			*uop = &(cntxt.bbl->oooBbl[0].uop[curUop[curQ]]);
			*bblContext = &cntxt;
			curUop[curQ] += 1;
			return true;
		} 
		
		else if ( ++curContext[curQ] < smtWindow->numContexts[curQ] ){
			/* OOOE: UOP not found. current queue, next basic block */
			curUop[curQ] = 0;
			BblContext& cntxt = smtWindow->queue[curQ][curContext[curQ]];

			/* OOOE: TODO: oooBbl != NULL && ...uops > 0 */
			if ( curUop[curQ] < cntxt.bbl->oooBbl[0].uops ){
				*uop = &(cntxt.bbl->oooBbl[0].uop[curUop[curQ]]);
				*bblContext = &cntxt;
				curUop[curQ] += 1;
				return true;
			}
			else {
				/* OOOE: Bbl not present or UOP not present */
				info("Last bbl, smtWindow->numContexts[%d] set to 0.", curQ);
				return false;
			}
		}
		
		else {
			/* OOOE: Just iterated through the last BBL */
			curUop[curQ] = 0;
			smtWindow->numContexts[curQ] = 0;
			info("Last bbl, smtWindow->numContexts[%d] set to 0.", curQ);
			return false;
		}
	}
	else {
	    /* OOOE: No BBL are left */
		smtWindow->numContexts[curQ] = 0;
		info("Last bbl, smtWindow->numContexts[%d] set to 0.", curQ);
		return false;
	}
}


