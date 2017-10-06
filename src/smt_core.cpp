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
#include "filter_cache.h"
#include "pad.h"
#include "zsim.h"

// Uncomment to enable stall stats
// #define OOO_STALL_STATS
extern GlobSimInfo* zinfo;

#define FETCH_STAGE 1
#define DECODE_STAGE 4
#define ISSUE_STAGE 7
#define DISPATCH_STAGE 13

#define L1D_LAT 4
#define FETCH_BYTES_PER_CYCLE 16
#define ISSUES_PER_CYCLE 4
#define RF_READS_PER_CYCLE 3

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
    uint8_t curQ = 0;
    uint32_t curContext[2] = {0,0};
    uint64_t curUop[2] = {0,0};
    uint8_t curBblSwap = 0;
    bool uopPresent = getUop(curQ, curContext, curUop, &uop, &bblContext, curBblSwap);

    uint32_t loadIdx = 0;
    uint32_t storeIdx = 0;

    uint32_t prevDecCycle = 0;
    uint64_t lastCommitCycle = 0;  // used to find misprediction penalty


    while (uopPresent){
        /* Run the uop here similar to bbl() */
        assert (uop != nullptr);
        //curCycle += 1;

		//fprintf(stderr, "OOOE: UOP found\n");
		assert (uop != 0);
		assert (bblContext != 0);
		//fprintf(stderr, "OOOE: uop:%p bblContext:%p\n", uop, bblContext);
		//info("OOOE: uop:%p bblContext:%p", uop, bblContext);
        
        runUop(loadIdx, storeIdx, prevDecCycle, lastCommitCycle, uop, bblContext);

		BblContext* prevContext = bblContext;

		/* Get new uop to run */
		uopPresent = getUop(curQ, curContext, curUop, &uop, &bblContext, curBblSwap);
		if(curBblSwap){
			curBblSwap = 0;
			runOther(loadIdx, storeIdx, lastCommitCycle, prevContext);
			/* TODO: Can we make storeIdx like a global showing how many lds/strs? */
			loadIdx = storeIdx = 0;
		}
    }
    
	if(curBblSwap){
		curBblSwap = 0;
		runOther(loadIdx, storeIdx, lastCommitCycle, bblContext);
	}

    /* TODO: Do I need to run the other sutff right here */

	fprintf(stderr, "OOOE: Done running through UOPS\n");

	futex_unlock(&windowLock);
	info("OOOE: playback(%d) updated curCycle: %lu", getpid(), curCycle);
}

/* OOOE: getUop()
 * Description: Function to get a specific UOP and BblContext object to run in playback()
 * Input: A DynUop and BblContext reference (Do not want a copy of them)
 * Output: Bool telling whether a UOP was retrieved (Only would happen in the case both Q's are empty)
 */
inline bool SMTCore::getUop(uint8_t& curQ, uint32_t (&curContext)[2], uint64_t (&curUop)[2], DynUop** uop, BblContext** bblContext, uint8_t& curBblSwap){
	/* OOOE: Arbitration section: The UOP chosen is based on the core state, etc */
    //printf("NumContxt:%d,%d\n", smtWindow->numContexts[0], smtWindow->numContexts[1] );
	if(smtWindow->numContexts[1 - curQ] != 0) {
    //printf("QUEUE SWITCH\n");
		curQ ^= 1; 
	}
	/* OOOE: End: Arbitration section */
	
	while ( true ){
		/* OOOE: Determine if there is a valid context to read in the Q */
		if ( curContext[curQ] < smtWindow->numContexts[curQ] ){
			BblContext& cntxt = smtWindow->queue[curQ][curContext[curQ]];

			/* OOOE: Determine if a UOP is present */
			//assert (cntxt.bbl->oooBbl != nullptr);
			if ( curUop[curQ] < cntxt.bbl->oooBbl[0].uops ){
				/* OOOE: Get UOP and BblContext from current Q */
				//info("OOOE: UOP Found");
				*uop = &(cntxt.bbl->oooBbl[0].uop[curUop[curQ]]);
				*bblContext = &cntxt;
				curUop[curQ] += 1;
				//printf("Q:%d BBL:%d UOP:%lu/%u\n", curQ, curContext[curQ], curUop[curQ], cntxt.bbl->oooBbl[0].uops);
				return true;
			} 
			else {
				/* OOOE: UOP not found. In the current Q move to the next BblContext */
				curBblSwap = 1;
				*bblContext = &cntxt;
				curUop[curQ] = 0;
				curContext[curQ] += 1;
				printf("Move to next BBL:%d\n", curContext[curQ]);
			}
		}
		else {
			/* OOOE: No BBL are left */
			info("OOOE: Last BblContext of Q:%d, numContexts[%d] set to 0.", curQ, curQ);
			smtWindow->numContexts[curQ] = 0;
			curUop[curQ] = 0;
			curContext[curQ] = 0;
			if ( smtWindow->numContexts[1-curQ] > 0 ){
				curQ ^= 1;
			}
			else {
				return false;
			}
		}
	}
}

inline void SMTCore::runOther(uint32_t& loadIdx, uint32_t& storeIdx, uint64_t& lastCommitCycle, BblContext* bblContext){

	/* OOOE: TODO: Implement instrs and bll */
	//instrs += bblInstrs;
	uops += bblContext->bbl->oooBbl[0].uops;
	bbls++;
	//approxInstrs += bbl->approxInstrs;

	//fprintf(stderr, "OOOE: 5a\n");

#ifdef BBL_PROFILING
	fprintf(stderr, "OOOE: BBlProfiling enabled\n");
	if (approxInstrs) Decoder::profileBbl(bbl->bblIdx);
#endif

	// Check full match between expected and actual mem ops
	// If these assertions fail, most likely, something's off in the decoder

	fprintf(stderr, "loadIdx(%d) != loads (%d)\n",loadIdx, bblContext->loads);
	fprintf(stderr, "storeIdx(%d) != stores (%d)\n",storeIdx, bblContext->stores);
	assert_msg(loadIdx == bblContext->loads, "%s: loadIdx(%d) != loads (%d)", name.c_str(), loadIdx, bblContext->loads);
	assert_msg(storeIdx == bblContext->stores, "%s: storeIdx(%d) != stores (%d)", name.c_str(), storeIdx, bblContext->stores);
	bblContext->loads = bblContext->stores = 0;
	//fprintf(stderr, "OOOE: 5c\n");

	//fprintf(stderr, "OOOE: 6\n");

	/* Simulate frontend for branch pred + fetch of this BBL
	*
	* NOTE: We assume that the instruction length predecoder and the IQ are
	* weak enough that they can't hide any ifetch or bpred stalls. In fact,
	* predecoder stalls are incorporated in the decode stall component (see
	* decoder.cpp). So here, we compute fetchCycle, then use it to adjust
	* decodeCycle.
	*/

	// Model fetch-decode delay (fixed, weak predec/IQ assumption)
	uint64_t fetchCycle = decodeCycle - (DECODE_STAGE - FETCH_STAGE);
	uint32_t lineSize = 1 << lineBits;

	//fprintf(stderr, "OOOE: 7\n");

	// Simulate branch prediction
	if (bblContext->branchPc && !branchPred.predict(bblContext->branchPc, bblContext->branchTaken)) {
		mispredBranches++;
		/* OOOE: AG:
		* Note: Here they start talking about BTB (a very basic form
		* of a branch pred) but the brach predictor object used here
		* is a pAg predictor.
		*
		* Per Address there is a history register.
		* Then there is a global storage data structure that holds the branch
		* locations.
		*/

		/* Simulate wrong-path fetches
		*
		* This is not for a latency reason, but sometimes it increases fetched
		* code footprint and L1I MPKI significantly. Also, we assume a perfect
		* BTB here: we always have the right address to missfetch on, and we
		* never need resteering.
		*
		* NOTE: Resteering due to BTB misses is done at the BAC unit, is
		* relatively rare, and carries an 8-cycle penalty, which should be
		* partially hidden if the branch is predicted correctly --- so we
		* don't simulate it.
		*
		* Since we don't have a BTB, we just assume the next branch is not
		* taken. With a typical branch mispred penalty of 17 cycles, we
		* typically fetch 3-4 lines in advance (16B/cycle). This sets a higher
		* limit, which can happen with branches that take a long time to
		* resolve (because e.g., they depend on a load). To set this upper
		* bound, assume a completely backpressured IQ (18 instrs), uop queue
		* (28 uops), IW (36 uops), and 16B instr length predecoder buffer. At
		* ~3.5 bytes/instr, 1.2 uops/instr, this is about 5 64-byte lines.
		*/

		// info("Mispredicted branch, %ld %ld %ld | %ld %ld", decodeCycle, curCycle, lastCommitCycle,
		//         lastCommitCycle-decodeCycle, lastCommitCycle-curCycle);
		/* OOOE: AG: Simulates having a wrong prediction*/
		Address wrongPathAddr = bblContext->branchTaken? bblContext->branchNotTakenNpc : bblContext->branchTakenNpc;
		uint64_t reqCycle = fetchCycle;
		for (uint32_t i = 0; i < 5*64/lineSize; i++) {
			uint64_t fetchLat = l1i->load(wrongPathAddr + lineSize*i, curCycle) - curCycle;
			cRec.record(curCycle, curCycle, curCycle + fetchLat);
			uint64_t respCycle = reqCycle + fetchLat;
			if (respCycle > lastCommitCycle) {
				break;
			}
			// Model fetch throughput limit
			reqCycle = respCycle + lineSize/FETCH_BYTES_PER_CYCLE;
		}

		fetchCycle = lastCommitCycle;
	}
	bblContext->branchPc = 0;  // clear for next BBL
	
	//fprintf(stderr, "OOOE: 8\n");

	// Simulate current bbl ifetch
	//Address endAddr = bblAddr + bblInfo->bytes;
	Address endAddr = bblContext->bblAddress + bblContext->bbl->bytes;
	for (Address fetchAddr = bblContext->bblAddress; fetchAddr < endAddr; fetchAddr += lineSize) {
		// The Nehalem frontend fetches instructions in 16-byte-wide accesses.
		// Do not model fetch throughput limit here, decoder-generated stalls already include it
		// We always call fetches with curCycle to avoid upsetting the weave
		// models (but we could move to a fetch-centric recorder to avoid this)
		uint64_t fetchLat = l1i->load(fetchAddr, curCycle) - curCycle;
		cRec.record(curCycle, curCycle, curCycle + fetchLat);
		fetchCycle += fetchLat;
	}

	//fprintf(stderr, "OOOE: 9\n");
	// If fetch rules, take into account delay between fetch and decode;
	// If decode rules, different BBLs make the decoders skip a cycle
	decodeCycle++;
	uint64_t minFetchDecCycle = fetchCycle + (DECODE_STAGE - FETCH_STAGE);
	if (minFetchDecCycle > decodeCycle) {
#ifdef OOO_STALL_STATS
		profFetchStalls.inc(decodeCycle - minFetchDecCycle);
#endif
		decodeCycle = minFetchDecCycle;
	}

}

inline void SMTCore::runUop(uint32_t& loadIdx, uint32_t& storeIdx, uint32_t prevDecCycle, uint64_t& lastCommitCycle, DynUop* uop, BblContext* bblContext){
    DynBbl* bbl = &(bblContext->bbl->oooBbl[0]);
    assert( bbl != nullptr );
    //fprintf(stderr, "OOOE: runUop entered\n");

    uint32_t decDiff = uop->decCycle - prevDecCycle;
    decodeCycle = MAX(decodeCycle + decDiff, uopQueue.minAllocCycle());
    if (decodeCycle > curCycle) {
        uint32_t cdDiff = decodeCycle - curCycle;
#ifdef OOO_STALL_STATS
        profDecodeStalls.inc(cdDiff);
#endif
        curCycleIssuedUops = 0;
        curCycleRFReads = 0;
        for (uint32_t i = 0; i < cdDiff; i++) insWindow.advancePos(curCycle);
    }
    prevDecCycle = uop->decCycle;
    uopQueue.markLeave(curCycle);

    //fprintf(stderr, "OOOE: 1\n");

    if (curCycleIssuedUops >= ISSUES_PER_CYCLE) {
#ifdef OOO_STALL_STATS
        profIssueStalls.inc();
#endif
        curCycleIssuedUops = 0;
        curCycleRFReads = 0;
        insWindow.advancePos(curCycle);
    }
    curCycleIssuedUops++;

    // Kill dependences on invalid register
    // Using curCycle saves us two unpredictable branches in the RF read stalls code
    regScoreboard[0] = curCycle;

    uint64_t c0 = regScoreboard[uop->rs[0]];
    uint64_t c1 = regScoreboard[uop->rs[1]];


    //fprintf(stderr, "OOOE: 2\n");

    // RF read stalls
    // if srcs are not available at issue time, we have to go thru the RF
    curCycleRFReads += ((c0 < curCycle)? 1 : 0) + ((c1 < curCycle)? 1 : 0);
    if (curCycleRFReads > RF_READS_PER_CYCLE) {
        curCycleRFReads -= RF_READS_PER_CYCLE;
        curCycleIssuedUops = 0;  // or 1? that's probably a 2nd-order detail
        insWindow.advancePos(curCycle);
    }

    uint64_t c2 = rob.minAllocCycle();
    uint64_t c3 = curCycle;

    uint64_t cOps = MAX(c0, c1);

    // Model RAT + ROB + RS delay between issue and dispatch
    uint64_t dispatchCycle = MAX(cOps, MAX(c2, c3) + (DISPATCH_STAGE - ISSUE_STAGE));

    // NOTE: Schedule can adjust both cur and dispatch cycles
    insWindow.schedule(curCycle, dispatchCycle, uop->portMask, uop->extraSlots);

    // If we have advanced, we need to reset the curCycle counters
    if (curCycle > c3) {
        curCycleIssuedUops = 0;
        curCycleRFReads = 0;
    }

    uint64_t commitCycle;

    //fprintf(stderr, "OOOE: 3\n");

    // LSU simulation
    // NOTE: Ever-so-slightly faster than if-else if-else if-else
    switch (uop->type) {
        case UOP_GENERAL:
            commitCycle = dispatchCycle + uop->lat;
            break;

        case UOP_LOAD:
            {
                // dispatchCycle = MAX(loadQueue.minAllocCycle(), dispatchCycle);
                uint64_t lqCycle = loadQueue.minAllocCycle();
                if (lqCycle > dispatchCycle) {
#ifdef LSU_IW_BACKPRESSURE
                    insWindow.poisonRange(curCycle, lqCycle, 0x4 /*PORT_2, loads*/);
#endif
                    dispatchCycle = lqCycle;
                }

                // Wait for all previous store addresses to be resolved
                dispatchCycle = MAX(lastStoreAddrCommitCycle+1, dispatchCycle);

                //Address addr = loadAddrs[loadIdx++];
				Address addr = bblContext->loadAddrs[loadIdx++];
                uint64_t reqSatisfiedCycle = dispatchCycle;
                if (addr != ((Address)-1L)) {
                    reqSatisfiedCycle = l1d->load(addr, dispatchCycle) + L1D_LAT;
                    cRec.record(curCycle, dispatchCycle, reqSatisfiedCycle);
                }

                // Enforce st-ld forwarding
                uint32_t fwdIdx = (addr>>2) & (FWD_ENTRIES-1);
                if (fwdArray[fwdIdx].addr == addr) {
                    // info("0x%lx FWD %ld %ld", addr, reqSatisfiedCycle, fwdArray[fwdIdx].storeCycle);
                    /* Take the MAX (see FilterCache's code) Our fwdArray
                     * imposes more stringent timing constraints than the
                     * l1d, b/c FilterCache does not change the line's
                     * availCycle on a store. This allows FilterCache to
                     * track per-line, not per-word availCycles.
                     */
                    reqSatisfiedCycle = MAX(reqSatisfiedCycle, fwdArray[fwdIdx].storeCycle);
                }

                commitCycle = reqSatisfiedCycle;
                loadQueue.markRetire(commitCycle);
            }
            break;

        case UOP_STORE:
            {
                // dispatchCycle = MAX(storeQueue.minAllocCycle(), dispatchCycle);
                uint64_t sqCycle = storeQueue.minAllocCycle();
                if (sqCycle > dispatchCycle) {
#ifdef LSU_IW_BACKPRESSURE
                    insWindow.poisonRange(curCycle, sqCycle, 0x10 /*PORT_4, stores*/);
#endif
                    dispatchCycle = sqCycle;
                }

                // Wait for all previous store addresses to be resolved (not just ours :))
                dispatchCycle = MAX(lastStoreAddrCommitCycle+1, dispatchCycle);

                //Address addr = storeAddrs[storeIdx++];
				Address addr = bblContext->storeAddrs[storeIdx++];
                uint64_t reqSatisfiedCycle = l1d->store(addr, dispatchCycle) + L1D_LAT;
                cRec.record(curCycle, dispatchCycle, reqSatisfiedCycle);

                // Fill the forwarding table
                fwdArray[(addr>>2) & (FWD_ENTRIES-1)].set(addr, reqSatisfiedCycle);

                commitCycle = reqSatisfiedCycle;
                lastStoreCommitCycle = MAX(lastStoreCommitCycle, reqSatisfiedCycle);
                storeQueue.markRetire(commitCycle);
            }
            break;

        case UOP_STORE_ADDR:
            commitCycle = dispatchCycle + uop->lat;
            lastStoreAddrCommitCycle = MAX(lastStoreAddrCommitCycle, commitCycle);
            break;

        //case UOP_FENCE:  //make gcc happy
        default:
            assert((UopType) uop->type == UOP_FENCE);
            commitCycle = dispatchCycle + uop->lat;
            // info("%d %ld %ld", uop->lat, lastStoreAddrCommitCycle, lastStoreCommitCycle);
            // force future load serialization
            lastStoreAddrCommitCycle = MAX(commitCycle, MAX(lastStoreAddrCommitCycle, lastStoreCommitCycle + uop->lat));
            // info("%d %ld %ld X", uop->lat, lastStoreAddrCommitCycle, lastStoreCommitCycle);
    }

    //fprintf(stderr, "OOOE: 4\n");

    // Mark retire at ROB
    rob.markRetire(commitCycle);

    // Record dependences
    regScoreboard[uop->rd[0]] = commitCycle;
    regScoreboard[uop->rd[1]] = commitCycle;

    lastCommitCycle = commitCycle;

    //info("0x%lx %3d [%3d %3d] -> [%3d %3d]  %8ld %8ld %8ld %8ld", bbl->addr, i, uop->rs[0], uop->rs[1], uop->rd[0], uop->rd[1], decCycle, c3, dispatchCycle, commitCycle);
    //fprintf(stderr, "OOOE: 5\n");

	/*************************************************************************************************************************************************************/
}
