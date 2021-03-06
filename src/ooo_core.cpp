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

#include "ooo_core.h"
#include <algorithm>
#include <queue>
#include <string>
#include "bithacks.h"
#include "decoder.h"
#include "filter_cache.h"
#include "zsim.h"
#include "log.h"

/* Uncomment to induce backpressure to the IW when the load/store buffers fill up. In theory, more detailed,
 * but sometimes much slower (as it relies on range poisoning in the IW, potentially O(n^2)), and in practice
 * makes a negligible difference (ROB backpressures).
 */
//#define LSU_IW_BACKPRESSURE

// #define DEBUG_MSG(args...)
#define DEBUG_MSG(args...) info(args)

// Core parameters
// TODO(dsm): Make OOOCore templated, subsuming these

// Stages --- more or less matched to Westmere, but have not seen detailed pipe diagrams anywhare
#define FETCH_STAGE 1
#define DECODE_STAGE 4  // NOTE: Decoder adds predecode delays to decode
#define ISSUE_STAGE 7
#define DISPATCH_STAGE 13  // RAT + ROB + RS, each is easily 2 cycles

#define L1D_LAT 4  // fixed, and FilterCache does not include L1 delay
#define FETCH_BYTES_PER_CYCLE 16
#define ISSUES_PER_CYCLE 4
#define RF_READS_PER_CYCLE 3

//#define OOO_PRINT
//#define BR_PRINT

OOOCore::OOOCore(FilterCache* _l1i, FilterCache* _l1d, g_string& _name) : Core(_name), l1i(_l1i), l1d(_l1d), cRec(0, _name) {
    decodeCycle = DECODE_STAGE;  // allow subtracting from it
    curCycle = 0;
    phaseEndCycle = zinfo->phaseLength;

    for (uint32_t i = 0; i < MAX_REGISTERS; i++) {
        regScoreboard[i] = 0;
    }
    prevBbl = nullptr;

    lastStoreCommitCycle = 0;
    lastStoreAddrCommitCycle = 0;
    curCycleRFReads = 0;
    curCycleIssuedUops = 0;
    branchPc = 0;

    instrs = uops = bbls = approxInstrs = mispredBranches = 0;

    for (uint32_t i = 0; i < FWD_ENTRIES; i++) fwdArray[i].set((Address)(-1L), 0);
}

void OOOCore::initStats(AggregateStat* parentStat) {
    AggregateStat* coreStat = new AggregateStat();
    coreStat->init(name.c_str(), "Core stats");

    auto x = [this]() { return cRec.getUnhaltedCycles(curCycle); };
    LambdaStat<decltype(x)>* cyclesStat = new LambdaStat<decltype(x)>(x);
    cyclesStat->init("cycles", "Simulated unhalted cycles");

    auto y = [this]() { return cRec.getContentionCycles(); };
    LambdaStat<decltype(y)>* cCyclesStat = new LambdaStat<decltype(y)>(y);
    cCyclesStat->init("cCycles", "Cycles due to contention stalls");

    ProxyStat* instrsStat = new ProxyStat();
    instrsStat->init("instrs", "Simulated instructions", &instrs);
    ProxyStat* uopsStat = new ProxyStat();
    uopsStat->init("uops", "Retired micro-ops", &uops);
    ProxyStat* bblsStat = new ProxyStat();
    bblsStat->init("bbls", "Basic blocks", &bbls);
    ProxyStat* approxInstrsStat = new ProxyStat();
    approxInstrsStat->init("approxInstrs", "Instrs with approx uop decoding", &approxInstrs);
    ProxyStat* mispredBranchesStat = new ProxyStat();
    mispredBranchesStat->init("mispredBranches", "Mispredicted branches", &mispredBranches);

    coreStat->append(cyclesStat);
    coreStat->append(cCyclesStat);
    coreStat->append(instrsStat);
    coreStat->append(uopsStat);
    coreStat->append(bblsStat);
    coreStat->append(approxInstrsStat);
    coreStat->append(mispredBranchesStat);

#ifdef OOO_STALL_STATS
    profFetchStalls.init("fetchStalls",  "Fetch stalls");  coreStat->append(&profFetchStalls);
    profDecodeStalls.init("decodeStalls", "Decode stalls"); coreStat->append(&profDecodeStalls);
    profIssueStalls.init("issueStalls",  "Issue stalls");  coreStat->append(&profIssueStalls);
#endif

    parentStat->append(coreStat);
}

uint64_t OOOCore::getInstrs() const {return instrs;}
uint64_t OOOCore::getPhaseCycles() const {return curCycle % zinfo->phaseLength;}

void OOOCore::markDone() {
	info("OOOCore: markDone");
}

void OOOCore::contextSwitch(int32_t gid) {
    if (gid == -1) {
        // Do not execute previous BBL, as we were context-switched
        prevBbl = nullptr;

        // Invalidate virtually-addressed filter caches
        l1i->contextSwitch();
        l1d->contextSwitch();
    }
}


InstrFuncPtrs OOOCore::GetFuncPtrs() {return {LoadFunc, StoreFunc, BblFunc, BranchFunc, PredLoadFunc, PredStoreFunc, FPTR_ANALYSIS, {0}};}

inline void OOOCore::load(Address addr) {
	//printf("OOOE: LOAD\n");
    loadAddrs[loads++] = addr;
}

void OOOCore::store(Address addr) {
	//printf("OOOE: STORE\n");
    storeAddrs[stores++] = addr;
}

// Predicated loads and stores call this function, gets recorded as a 0-cycle op.
// Predication is rare enough that we don't need to model it perfectly to be accurate (i.e. the uops still execute, retire, etc), but this is needed for correctness.
void OOOCore::predFalseMemOp() {
    // I'm going to go out on a limb and assume just loads are predicated (this will not fail silently if it's a store)
	//printf("OOOE: LOAD\n");
    loadAddrs[loads++] = -1L;
}

void OOOCore::branch(Address pc, bool taken, Address takenNpc, Address notTakenNpc) {
	//printf("OOOE: BRANCH\n");
    branchPc = pc;
    branchTaken = taken;
    branchTakenNpc = takenNpc;
    branchNotTakenNpc = notTakenNpc;
}

/* OOOE: AG:
 * Seems to decode 1 BBL at a time. This function is called by PIN through
 * a series a function pointers to this function.
 *
 * Starts simulation by not passing in the current BBL but by getting the
 * previous BBL specified in a linked list sort of fashion. 
 *
 * What I mean by LL fashion:
 *
 * 1. PIN calls OOOCore::bbl(...)
 * 2. If prevbbl is present then run it (go to 4)
 * 3. Else make prevbbl point to new bblInfo that was passed in
 * 4. Run prevbbl stuff and make prevbbl point to new bblInfo for the next
 *    time this function is called.
 */
inline void OOOCore::bbl(Address bblAddr, BblInfo* bblInfo) {
    //info("OOOE: AG: bbl() called: CurCycle = %lu \n", curCycle);
    if (!prevBbl) {
		//printf("OOOE: BBL SKIP\n");
        // This is the 1st BBL since scheduled, nothing to simulate
        prevBbl = bblInfo;
        // Kill lingering ops from previous BBL
        loads = stores = 0;
        return;
    }
	//printf("OOOE: BBL L:%d S:%d\n", loads, stores);

    /* OOOE: AG:
     * Simulate execution of previous BBL.
     */

    /* OOOE: AG:
     * Gets the previous BBL and makes it the "one to run"
     * Also appends the passed in bblInfo the prevBBl 
     */
    uint32_t bblInstrs = prevBbl->instrs;
    DynBbl* bbl = &(prevBbl->oooBbl[0]);
    prevBbl = bblInfo;

#ifdef OOO_PRINT
    info("bbl:%p addr:%lx ld:%u st:%u brpc:%lx, brTk:%d brTkN:%lx brNTNpc:%lx",
            prevBbl, bblAddr, loads, stores, branchPc, branchTaken, branchTakenNpc,
            branchNotTakenNpc);
#endif

#ifdef BR_PRINT
    info("brPC:%lx, brTkn:%d brTknNPC:%lx brNTknNPC:%lx", branchPc, branchTaken, branchTakenNpc,  branchNotTakenNpc);
#endif


    uint32_t loadIdx = 0;
    uint32_t storeIdx = 0;

    uint32_t prevDecCycle = 0;
    uint64_t lastCommitCycle = 0;  // used to find misprediction penalty

    /* OOOE: AG:
     * For all the UOPS inside of the BBL, run each and every one. Although,
     * they call this an instruction window? Even though the "instr
     * window" here is fixed to only the uops inside of the BBL.
     */
    //info("OOOE: PID:%d BBLADDR:0x%lx", getpid(), bbl->addr);
    // Run dispatch/IW
	//printf("OOOE: AMTUOPS:%u\n", bbl->uops);
    for (uint32_t i = 0; i < bbl->uops; i++) {
        DynUop* uop = &(bbl->uop[i]);
#ifdef OOO_PRINT
        info("\nOOOE: curCycle:%lu prevDecCycle:%d decodeCycle:%lu", curCycle, prevDecCycle, decodeCycle);
        if ( uop->type == UOP_LOAD ){
            info("LOAD");
        }
        else if ( uop->type == UOP_STORE ){
            info("STORE");
        }
        else{
            info("OTHER");
        }
#endif

        /* OOOE: AG:
         * Does decCycle mean "arbitrary time associated with this uops decode?"
         * TODO: What is this section doing?
         */
        // Decode stalls
        /* OOOE: AG:
         * What is the current amount of decode difference between the prev cycle checkpoint
         * and when the uop is supposed to run 
         * Seems to be that the uop->decCycle is when the uop was decoded from the PIN (actual cycle from the 
         * processor.
         */
        /* OOOE: AG: 
         * Set when the prevDecCycle is the decode cycle count from the prev UOP */
        //info("OOOE: UOP#:%d UOPDECCYCLE:%d COREDECCYCLE:%lu", i, uop->decCycle, decodeCycle);
        uint32_t decDiff = uop->decCycle - prevDecCycle;
#ifdef OOO_PRINT
		info("decDiff:%u uop->decCycle:%lu prevDecCycle:%lu", decDiff, uop->decCycle, prevDecCycle);
#endif
        /* OOOE: AG: uopQueue has amount of uops and when they are marked for retiring */
        decodeCycle = MAX(decodeCycle + decDiff, uopQueue.minAllocCycle());

#ifdef OOO_PRINT
		info("uopQueueminAlloc:%lu", uopQueue.minAllocCycle());
        info("decodeCycle:%lu", decodeCycle);
#endif
        /* OOOE: AG: curCycle is current issue cycle
         * Maybe decodeCycle is the decode cycle that is kept track of with the simulator
         * (when the decode is supposed to start?)
         */
        if (decodeCycle > curCycle) {
            //info("Decode stall %ld %ld | %d %d", decodeCycle, curCycle, uop->decCycle, prevDecCycle);
            uint32_t cdDiff = decodeCycle - curCycle;
#ifdef OOO_STALL_STATS
            profDecodeStalls.inc(cdDiff);
#endif
            curCycleIssuedUops = 0;
            curCycleRFReads = 0;
            /* OOOE: AG:
             * Moves to the next position in the instruction window but if it is at the
             * end then moves to the next instruction window.
             */
            for (uint32_t i = 0; i < cdDiff; i++) insWindow.advancePos(curCycle);
        }

#ifdef OOO_PRINT
        info("curCycle:%lu", curCycle);
#endif
        prevDecCycle = uop->decCycle;
        /* OOOE: AG: Appends in the queue when this UOP should finish so that
         * in the next iteration of the for loop it has when this UOP should finish
         * NOTE: Retrieve the previous UOP cycle (uopQueue.minAllocCycle()) */
        uopQueue.markLeave(curCycle);

        // Implement issue width limit --- we can only issue 4 uops/cycle
        if (curCycleIssuedUops >= ISSUES_PER_CYCLE) {
#ifdef OOO_STALL_STATS
            profIssueStalls.inc();
#endif
            // info("Advancing due to uop issue width");
            /* OOOE: AG:
             * Why does this clear the amt of UOPS and then move to the next entry in the instr win? */
            curCycleIssuedUops = 0;
            curCycleRFReads = 0;
            insWindow.advancePos(curCycle);
        }
        curCycleIssuedUops++;

#ifdef OOO_PRINT
        info("curCycleIssuedUops:%d", curCycleIssuedUops);
#endif
        // Kill dependences on invalid register
        // Using curCycle saves us two unpredictable branches in the RF read stalls code
        regScoreboard[0] = curCycle;

        /* OOOE: AG:
         * Get the scoreboard issue cycle for the source registers
         * Gives issue cycle where the register *CAN* be sourced 
         */
        uint64_t c0 = regScoreboard[uop->rs[0]];
        uint64_t c1 = regScoreboard[uop->rs[1]];

        /* OOOE: AG: RF = Register File */
        // RF read stalls
        // if srcs are not available at issue time, we have to go thru the RF
        curCycleRFReads += ((c0 < curCycle)? 1 : 0) + ((c1 < curCycle)? 1 : 0);
        /* OOOE: AG: Amt of times the regFile is read must be less than 3 then
         * it reads it in and zeros out the issues UOPs and advances the instrWin */
        if (curCycleRFReads > RF_READS_PER_CYCLE) {
            curCycleRFReads -= RF_READS_PER_CYCLE;
            curCycleIssuedUops = 0;  // or 1? that's probably a 2nd-order detail
            insWindow.advancePos(curCycle);
        }

#ifdef OOO_PRINT
        info("curCycleRFReads:%d", curCycleRFReads);
#endif

        uint64_t c2 = rob.minAllocCycle();
        uint64_t c3 = curCycle;

        /* OOOE: AG: When the last src reg is "ready" */
        uint64_t cOps = MAX(c0, c1);

        // Model RAT + ROB + RS delay between issue and dispatch
        /* OOOE: AG: Estimating the delay to dispatch to the execution units */
        uint64_t dispatchCycle = MAX(cOps, MAX(c2, c3) + (DISPATCH_STAGE - ISSUE_STAGE));

#ifdef OOO_PRINT
        info("dispatchCycle:%lu curCycle:%lu", dispatchCycle, curCycle);
#endif

        // info("IW 0x%lx %d %ld %ld %x", bblAddr, i, c2, dispatchCycle, uop->portMask);
        // NOTE: Schedule can adjust both cur and dispatch cycles
        insWindow.schedule(curCycle, dispatchCycle, uop->portMask, uop->extraSlots);

#ifdef OOO_PRINT
        info("curCycle:%lu dispatchCycle:%lu portMask:%d extraSlots:%d", curCycle, dispatchCycle, uop->portMask, uop->extraSlots);
#endif

        // If we have advanced, we need to reset the curCycle counters
        if (curCycle > c3) {
            curCycleIssuedUops = 0;
            curCycleRFReads = 0;
        }

        uint64_t commitCycle;

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
#ifdef OOO_PRINT
                    info("lqCycle:%lu", lqCycle);
#endif
                    if (lqCycle > dispatchCycle) {
#ifdef LSU_IW_BACKPRESSURE
                        insWindow.poisonRange(curCycle, lqCycle, 0x4 /*PORT_2, loads*/);
#endif
                        dispatchCycle = lqCycle;
                    }

#ifdef OOO_PRINT
                    info("dispatchCycle:%lu", dispatchCycle);
#endif

                    // Wait for all previous store addresses to be resolved
                    dispatchCycle = MAX(lastStoreAddrCommitCycle+1, dispatchCycle);

                    Address addr = loadAddrs[loadIdx++];
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

#ifdef OOO_PRINT
                    info("SqCycle:%lu", sqCycle);
#endif
                    if (sqCycle > dispatchCycle) {
#ifdef LSU_IW_BACKPRESSURE
                        insWindow.poisonRange(curCycle, sqCycle, 0x10 /*PORT_4, stores*/);
#endif
                        dispatchCycle = sqCycle;
                    }

                    // Wait for all previous store addresses to be resolved (not just ours :))
                    dispatchCycle = MAX(lastStoreAddrCommitCycle+1, dispatchCycle);

#ifdef OOO_PRINT
                    info("dispatchCycle:%lu", dispatchCycle);
#endif

                    Address addr = storeAddrs[storeIdx++];
                    uint64_t reqSatisfiedCycle = l1d->store(addr, dispatchCycle) + L1D_LAT;

#ifdef OOO_PRINT
                    info("reqSatisfiedCycle:%lu", reqSatisfiedCycle);
#endif
                    cRec.record(curCycle, dispatchCycle, reqSatisfiedCycle);

                    // Fill the forwarding table
                    fwdArray[(addr>>2) & (FWD_ENTRIES-1)].set(addr, reqSatisfiedCycle);

                    commitCycle = reqSatisfiedCycle;
                    lastStoreCommitCycle = MAX(lastStoreCommitCycle, reqSatisfiedCycle);

#ifdef OOO_PRINT
                    info("LastScCycle:%lu", lastStoreCommitCycle);
#endif
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

        // Mark retire at ROB
        rob.markRetire(commitCycle);


#ifdef OOO_PRINT
        info("commitCycle:%lu", commitCycle);
#endif
        // Record dependences
        /* OOOE: AG: Seems like regscorebd puts the actual cycle # inside to
         * when it is ready to be issued or ready to be committed */
        regScoreboard[uop->rd[0]] = commitCycle;
        regScoreboard[uop->rd[1]] = commitCycle;

        lastCommitCycle = commitCycle;

        //info("0x%lx %3d [%3d %3d] -> [%3d %3d]  %8ld %8ld %8ld %8ld", bbl->addr, i, uop->rs[0], uop->rs[1], uop->rd[0], uop->rd[1], decCycle, c3, dispatchCycle, commitCycle);
    }

    /* OOOE: AG: Counters in the core file, Im guessing just for simulation purposes */
    instrs += bblInstrs;
    uops += bbl->uops;
    bbls++;
    approxInstrs += bbl->approxInstrs;

#ifdef BBL_PROFILING
    if (approxInstrs) Decoder::profileBbl(bbl->bblIdx);
#endif

    // Check full match between expected and actual mem ops
    // If these assertions fail, most likely, something's off in the decoder
    assert_msg(loadIdx == loads, "%s: loadIdx(%d) != loads (%d)", name.c_str(), loadIdx, loads);
    assert_msg(storeIdx == stores, "%s: storeIdx(%d) != stores (%d)", name.c_str(), storeIdx, stores);
    loads = stores = 0;


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

    bool check = !branchPred.predict(branchPc, branchTaken);
#ifdef OOO_PRINT
    info("fetchCycle:%lu", fetchCycle);
#endif
#ifdef BR_PRINT
    info("branchPc:%lx branchPred.predict:%d, branchTaken:%d", branchPc, check, branchTaken);
#endif

    /* OOOE: AG: Branch prediction location */
    // Simulate branch prediction
    if (branchPc && check) {
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
        Address wrongPathAddr = branchTaken? branchNotTakenNpc : branchTakenNpc;
        uint64_t reqCycle = fetchCycle;
        for (uint32_t i = 0; i < 5*64/lineSize; i++) {
            uint64_t fetchLat = l1i->load(wrongPathAddr + lineSize*i, curCycle) - curCycle;
            /* OOOE: AG: TODO: FIgure out what record does */
            cRec.record(curCycle, curCycle, curCycle + fetchLat);
            uint64_t respCycle = reqCycle + fetchLat;
            /* OOOE: AG: TODO: Fully understand this */
            if (respCycle > lastCommitCycle) {
                break;
            }
            // Model fetch throughput limit
            reqCycle = respCycle + lineSize/FETCH_BYTES_PER_CYCLE;
        }

        fetchCycle = lastCommitCycle;

#ifdef OOO_PRINT
        info("fetchCycle mispred:%lu", fetchCycle);
#endif
    }


#ifdef BR_PRINT 
        info("brPC cleared");
#endif
    branchPc = 0;  // clear for next BBL

    /* OOOE: AG: Getting the next instructions in the bbl based on the branch pred
     * (whether or not it was right or wrong */
    // Simulate current bbl ifetch
    Address endAddr = bblAddr + bblInfo->bytes;
#ifdef OOO_PRINT
    info("endAddr:x%lx bblAddr:x%lx bytes:%lu lineSize:%lu", endAddr, bblAddr, bblInfo->bytes, lineSize);
#endif
    for (Address fetchAddr = bblAddr; fetchAddr < endAddr; fetchAddr += lineSize) {
        // The Nehalem frontend fetches instructions in 16-byte-wide accesses.
        // Do not model fetch throughput limit here, decoder-generated stalls already include it
        // We always call fetches with curCycle to avoid upsetting the weave
        // models (but we could move to a fetch-centric recorder to avoid this)
        /* OOOE: Fetch latency from reading the instruction from the cache */
        uint64_t fetchLat = l1i->load(fetchAddr, curCycle) - curCycle;
        cRec.record(curCycle, curCycle, curCycle + fetchLat);
        fetchCycle += fetchLat;
        //info("Adding to fetch:%lu", fetchLat);
    }
    //info("fetchCycle +lat:%lu", fetchCycle);

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
#ifdef OOO_PRINT
	info("FrontEnd Update: decodeCycle:%lu", decodeCycle);
#endif
}

// Timing simulation code
void OOOCore::join() {
    DEBUG_MSG("[%s] Joining, curCycle %ld phaseEnd %ld", name.c_str(), curCycle, phaseEndCycle);
    uint64_t targetCycle = cRec.notifyJoin(curCycle);
    if (targetCycle > curCycle) advance(targetCycle);
    phaseEndCycle = zinfo->globPhaseCycles + zinfo->phaseLength;
    // assert(targetCycle <= phaseEndCycle);
    DEBUG_MSG("[%s] Joined, curCycle %ld phaseEnd %ld", name.c_str(), curCycle, phaseEndCycle);
}

void OOOCore::leave() {
    DEBUG_MSG("[%s] Leaving, curCycle %ld phaseEnd %ld", name.c_str(), curCycle, phaseEndCycle);
    cRec.notifyLeave(curCycle);
}

void OOOCore::cSimStart() {
    //info("OOOE: cSimStart()");
    uint64_t targetCycle = cRec.cSimStart(curCycle);
    assert(targetCycle >= curCycle);
    if (targetCycle > curCycle) advance(targetCycle);
}

void OOOCore::cSimEnd() {
    //info("OOOE: cSimEnd()");
    uint64_t targetCycle = cRec.cSimEnd(curCycle);
    assert(targetCycle >= curCycle);
    if (targetCycle > curCycle) advance(targetCycle);
}

void OOOCore::advance(uint64_t targetCycle) {
    assert(targetCycle > curCycle);
    decodeCycle += targetCycle - curCycle;
    insWindow.longAdvance(curCycle, targetCycle);
    curCycleRFReads = 0;
    curCycleIssuedUops = 0;
    assert(targetCycle == curCycle);
    /* NOTE: Validation with weave mems shows that not advancing internal cycle
     * counters in e.g., the ROB does not change much; consider full-blown
     * rebases though if weave models fail to validate for some app.
     */
}

// Pin interface code

void OOOCore::LoadFunc(THREADID tid, ADDRINT addr) {static_cast<OOOCore*>(cores[tid])->load(addr);}
void OOOCore::StoreFunc(THREADID tid, ADDRINT addr) {static_cast<OOOCore*>(cores[tid])->store(addr);}

void OOOCore::PredLoadFunc(THREADID tid, ADDRINT addr, BOOL pred) {
    OOOCore* core = static_cast<OOOCore*>(cores[tid]);
    if (pred) core->load(addr);
    else core->predFalseMemOp();
}

void OOOCore::PredStoreFunc(THREADID tid, ADDRINT addr, BOOL pred) {
    OOOCore* core = static_cast<OOOCore*>(cores[tid]);
    if (pred) core->store(addr);
    else core->predFalseMemOp();
}

void OOOCore::BblFunc(THREADID tid, ADDRINT bblAddr, BblInfo* bblInfo) {
    OOOCore* core = static_cast<OOOCore*>(cores[tid]);
    //info("OOOE: TID:%d\n", tid);
    /*OOOE: Function where basic blocks are analyzed on a core basis */
    core->bbl(bblAddr, bblInfo);

    while (core->curCycle > core->phaseEndCycle) {
        core->phaseEndCycle += zinfo->phaseLength;

        uint32_t cid = getCid(tid);
        // NOTE: TakeBarrier may take ownership of the core, and so it will be used by some other thread. If TakeBarrier context-switches us,
        // the *only* safe option is to return inmmediately after we detect this, or we can race and corrupt core state. However, the information
        // here is insufficient to do that, so we could wind up double-counting phases.
        uint32_t newCid = TakeBarrier(tid, cid);
        // NOTE: Upon further observation, we cannot race if newCid == cid, so this code should be enough.
        // It may happen that we had an intervening context-switch and we are now back to the same core.
        // This is fine, since the loop looks at core values directly and there are no locals involved,
        // so we should just advance as needed and move on.
        if (newCid != cid) break;  /*context-switch, we do not own this context anymore*/
    }
}

void OOOCore::BranchFunc(THREADID tid, ADDRINT pc, BOOL taken, ADDRINT takenNpc, ADDRINT notTakenNpc) {
    static_cast<OOOCore*>(cores[tid])->branch(pc, taken, takenNpc, notTakenNpc);
}

