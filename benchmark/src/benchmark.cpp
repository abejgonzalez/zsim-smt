#include <stdio.h>
#include <sched.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <unistd.h>

#include <pthread.h>
#include <algorithm>

#include "benchmark.h"
#include "cpu.h"

// #define DEBUG_H // print debugging
// #define SIM_H // zsim simulation

#define MAX_SIZE 1 * 1024 * 1024
#define HYPER_THREADS 2

#ifdef DEBUG_H
void print_self() {
	int cpu_id = sched_getcpu();
	printf("thread[%.2x] cpu: %d, core: %d\n", (pthread_self() >> 8) & 0xff, cpu_id, cpu_id / HYPER_THREADS);
}
#endif 

// deterministic branching process
void * branch_good(void * arg) {
	#ifndef SIM_H
    	int cid = (intptr_t) arg;
    	set_thread_cpu(cid);
	#endif

    int data[10000]; // random branch seeds
    for (unsigned c = 0; c < 10000; ++c) {
        data[c] = std::rand() % 256;
	}

	// adds order to branching
    std::sort(data, data + 10000);

	// stress branch predictor
    long long sum = 0;
    for (unsigned i = 0; i < 100; ++i) {
        for (unsigned c = 0; c < 10000; ++c) {
            if (data[c] >= 128) 
				sum += data[c];
			#ifdef DEBUG_H 
				print_self();
			#endif
        }
    }
}

// stochastic branching process
void * branch_miss(void * arg) {
	#ifndef SIM_H
    	int cid = (intptr_t) arg;
    	set_thread_cpu(cid);
	#endif

    int data[10000]; // random branch seeds
    for (unsigned c = 0; c < 10000; ++c) {
        data[c] = std::rand() % 256;
	}

	// adds order to branching
    // std::sort(data, data + 10000);

	// stress branch predictor
    long long sum = 0;
    for (unsigned i = 0; i < 100; ++i) {
        for (unsigned c = 0; c < 10000; ++c) {
            if (data[c] >= 128) 
				sum += data[c];
			#ifdef DEBUG_H 
				print_self();
			#endif
        }
    }
}

// deterministically index memory
void * dcache_good(void * arg) {
	#ifndef SIM_H
    	int cid = (intptr_t) arg;
    	set_thread_cpu(cid);
	#endif
	
	int x[MAX_SIZE];
	for (int i = 0; i < 20000; ++i) {
		x[i] = i; 
		#ifdef DEBUG_H
			print_self();
		#endif
	}
}

// stochastically index memory
void * dcache_miss(void * arg) {
	#ifndef SIM_H
    	int cid = (intptr_t) arg;
    	set_thread_cpu(cid);
	#endif

	std::default_random_engine generator;
	std::uniform_int_distribution<int> distribution(0, MAX_SIZE);

	int x[MAX_SIZE];
	for (int i = 0; i < 20000; ++i) {
		x[distribution(generator)] = i;
		#ifdef DEBUG_H
			print_self();
		#endif
	}
}

// executes the cases in deterministic order
void * icache_good(void * arg) {
	#ifndef SIM_H
    	int cid = (intptr_t) arg;
    	set_thread_cpu(cid);
	#endif
	
    for (int i = 0; i < 10000; i++) {
		#ifdef DEBUG_H
			print_self();
		#endif

		int sum = 0;
		switch (i) {
			case  0: for (int j = 0; j < 100; j++) sum++; break;
			case  1: for (int j = 0; j < 100; j++) sum++; break;
			case  2: for (int j = 0; j < 100; j++) sum++; break;
			case  3: for (int j = 0; j < 100; j++) sum++; break;
			case  4: for (int j = 0; j < 100; j++) sum++; break;
			case  5: for (int j = 0; j < 100; j++) sum++; break;
			case  6: for (int j = 0; j < 100; j++) sum++; break;
			case  7: for (int j = 0; j < 100; j++) sum++; break;
			case  8: for (int j = 0; j < 100; j++) sum++; break;
			case  9: for (int j = 0; j < 100; j++) sum++; break;
			case 10: for (int j = 0; j < 100; j++) sum++; break;
			case 11: for (int j = 0; j < 100; j++) sum++; break;
			case 12: for (int j = 0; j < 100; j++) sum++; break;
			case 13: for (int j = 0; j < 100; j++) sum++; break;
			case 14: for (int j = 0; j < 100; j++) sum++; break;
			case 15: for (int j = 0; j < 100; j++) sum++; break;
			case 16: for (int j = 0; j < 100; j++) sum++; break;
			case 17: for (int j = 0; j < 100; j++) sum++; break;
			case 18: for (int j = 0; j < 100; j++) sum++; break;
			case 19: for (int j = 0; j < 100; j++) sum++; break;
			case 20: for (int j = 0; j < 100; j++) sum++; break;
			case 21: for (int j = 0; j < 100; j++) sum++; break;
			case 22: for (int j = 0; j < 100; j++) sum++; break;
			case 23: for (int j = 0; j < 100; j++) sum++; break;
			case 24: for (int j = 0; j < 100; j++) sum++; break;
			case 25: for (int j = 0; j < 100; j++) sum++; break;
			case 26: for (int j = 0; j < 100; j++) sum++; break;
			case 27: for (int j = 0; j < 100; j++) sum++; break;
			case 28: for (int j = 0; j < 100; j++) sum++; break;
			case 29: for (int j = 0; j < 100; j++) sum++; break;
			case 30: for (int j = 0; j < 100; j++) sum++; break;
			case 31: for (int j = 0; j < 100; j++) sum++; break;
			case 32: for (int j = 0; j < 100; j++) sum++; break;
			case 33: for (int j = 0; j < 100; j++) sum++; break;
			case 34: for (int j = 0; j < 100; j++) sum++; break;
			case 35: for (int j = 0; j < 100; j++) sum++; break;
			case 36: for (int j = 0; j < 100; j++) sum++; break;
			case 37: for (int j = 0; j < 100; j++) sum++; break;
			case 38: for (int j = 0; j < 100; j++) sum++; break;
			case 39: for (int j = 0; j < 100; j++) sum++; break;
			case 40: for (int j = 0; j < 100; j++) sum++; break;
			case 41: for (int j = 0; j < 100; j++) sum++; break;
			case 42: for (int j = 0; j < 100; j++) sum++; break;
			case 43: for (int j = 0; j < 100; j++) sum++; break;
			case 44: for (int j = 0; j < 100; j++) sum++; break;
			case 45: for (int j = 0; j < 100; j++) sum++; break;
			case 46: for (int j = 0; j < 100; j++) sum++; break;
			case 47: for (int j = 0; j < 100; j++) sum++; break;
			case 48: for (int j = 0; j < 100; j++) sum++; break;
			case 49: for (int j = 0; j < 100; j++) sum++; break;
			case 50: for (int j = 0; j < 100; j++) sum++; break;
			case 51: for (int j = 0; j < 100; j++) sum++; break;
			case 52: for (int j = 0; j < 100; j++) sum++; break;
			case 53: for (int j = 0; j < 100; j++) sum++; break;
			case 54: for (int j = 0; j < 100; j++) sum++; break;
			case 55: for (int j = 0; j < 100; j++) sum++; break;
			case 56: for (int j = 0; j < 100; j++) sum++; break;
			case 57: for (int j = 0; j < 100; j++) sum++; break;
			case 58: for (int j = 0; j < 100; j++) sum++; break;
			case 59: for (int j = 0; j < 100; j++) sum++; break;
			case 60: for (int j = 0; j < 100; j++) sum++; break;
			case 61: for (int j = 0; j < 100; j++) sum++; break;
			case 62: for (int j = 0; j < 100; j++) sum++; break;
			case 63: for (int j = 0; j < 100; j++) sum++; break;
			case 64: for (int j = 0; j < 100; j++) sum++; break;
			case 65: for (int j = 0; j < 100; j++) sum++; break;
			case 66: for (int j = 0; j < 100; j++) sum++; break;
			case 67: for (int j = 0; j < 100; j++) sum++; break;
			case 68: for (int j = 0; j < 100; j++) sum++; break;
			case 69: for (int j = 0; j < 100; j++) sum++; break;
			case 70: for (int j = 0; j < 100; j++) sum++; break;
			case 71: for (int j = 0; j < 100; j++) sum++; break;
			case 72: for (int j = 0; j < 100; j++) sum++; break;
			case 73: for (int j = 0; j < 100; j++) sum++; break;
			case 74: for (int j = 0; j < 100; j++) sum++; break;
			case 75: for (int j = 0; j < 100; j++) sum++; break;
			case 76: for (int j = 0; j < 100; j++) sum++; break;
			case 77: for (int j = 0; j < 100; j++) sum++; break;
			case 78: for (int j = 0; j < 100; j++) sum++; break;
			case 79: for (int j = 0; j < 100; j++) sum++; break;
			case 80: for (int j = 0; j < 100; j++) sum++; break;
			case 81: for (int j = 0; j < 100; j++) sum++; break;
			case 82: for (int j = 0; j < 100; j++) sum++; break;
			case 83: for (int j = 0; j < 100; j++) sum++; break;
			case 84: for (int j = 0; j < 100; j++) sum++; break;
			case 85: for (int j = 0; j < 100; j++) sum++; break;
			case 86: for (int j = 0; j < 100; j++) sum++; break;
			case 87: for (int j = 0; j < 100; j++) sum++; break;
			case 88: for (int j = 0; j < 100; j++) sum++; break;
			case 89: for (int j = 0; j < 100; j++) sum++; break;
			case 90: for (int j = 0; j < 100; j++) sum++; break;
			case 91: for (int j = 0; j < 100; j++) sum++; break;
			case 92: for (int j = 0; j < 100; j++) sum++; break;
			case 93: for (int j = 0; j < 100; j++) sum++; break;
			case 94: for (int j = 0; j < 100; j++) sum++; break;
			case 95: for (int j = 0; j < 100; j++) sum++; break;
			case 96: for (int j = 0; j < 100; j++) sum++; break;
			case 97: for (int j = 0; j < 100; j++) sum++; break;
			case 98: for (int j = 0; j < 100; j++) sum++; break;
			case 99: for (int j = 0; j < 100; j++) sum++; break;
		}
	}
}

// executes the cases in stochastic order
void * icache_miss(void * arg) {
	#ifndef SIM_H
		int cid = (intptr_t) arg;
		set_thread_cpu(cid);
	#endif
	
	std::default_random_engine generator;
	std::uniform_int_distribution<int> distribution(0, 100);

    for (int i = 0; i < 10000; i++) {
		#ifdef DEBUG_H
			print_self();
		#endif

		int sum = 0;
		switch (distribution(generator)) {
			case  0: for (int j = 0; j < 100; j++) sum++; break;
			case  1: for (int j = 0; j < 100; j++) sum++; break;
			case  2: for (int j = 0; j < 100; j++) sum++; break;
			case  3: for (int j = 0; j < 100; j++) sum++; break;
			case  4: for (int j = 0; j < 100; j++) sum++; break;
			case  5: for (int j = 0; j < 100; j++) sum++; break;
			case  6: for (int j = 0; j < 100; j++) sum++; break;
			case  7: for (int j = 0; j < 100; j++) sum++; break;
			case  8: for (int j = 0; j < 100; j++) sum++; break;
			case  9: for (int j = 0; j < 100; j++) sum++; break;
			case 10: for (int j = 0; j < 100; j++) sum++; break;
			case 11: for (int j = 0; j < 100; j++) sum++; break;
			case 12: for (int j = 0; j < 100; j++) sum++; break;
			case 13: for (int j = 0; j < 100; j++) sum++; break;
			case 14: for (int j = 0; j < 100; j++) sum++; break;
			case 15: for (int j = 0; j < 100; j++) sum++; break;
			case 16: for (int j = 0; j < 100; j++) sum++; break;
			case 17: for (int j = 0; j < 100; j++) sum++; break;
			case 18: for (int j = 0; j < 100; j++) sum++; break;
			case 19: for (int j = 0; j < 100; j++) sum++; break;
			case 20: for (int j = 0; j < 100; j++) sum++; break;
			case 21: for (int j = 0; j < 100; j++) sum++; break;
			case 22: for (int j = 0; j < 100; j++) sum++; break;
			case 23: for (int j = 0; j < 100; j++) sum++; break;
			case 24: for (int j = 0; j < 100; j++) sum++; break;
			case 25: for (int j = 0; j < 100; j++) sum++; break;
			case 26: for (int j = 0; j < 100; j++) sum++; break;
			case 27: for (int j = 0; j < 100; j++) sum++; break;
			case 28: for (int j = 0; j < 100; j++) sum++; break;
			case 29: for (int j = 0; j < 100; j++) sum++; break;
			case 30: for (int j = 0; j < 100; j++) sum++; break;
			case 31: for (int j = 0; j < 100; j++) sum++; break;
			case 32: for (int j = 0; j < 100; j++) sum++; break;
			case 33: for (int j = 0; j < 100; j++) sum++; break;
			case 34: for (int j = 0; j < 100; j++) sum++; break;
			case 35: for (int j = 0; j < 100; j++) sum++; break;
			case 36: for (int j = 0; j < 100; j++) sum++; break;
			case 37: for (int j = 0; j < 100; j++) sum++; break;
			case 38: for (int j = 0; j < 100; j++) sum++; break;
			case 39: for (int j = 0; j < 100; j++) sum++; break;
			case 40: for (int j = 0; j < 100; j++) sum++; break;
			case 41: for (int j = 0; j < 100; j++) sum++; break;
			case 42: for (int j = 0; j < 100; j++) sum++; break;
			case 43: for (int j = 0; j < 100; j++) sum++; break;
			case 44: for (int j = 0; j < 100; j++) sum++; break;
			case 45: for (int j = 0; j < 100; j++) sum++; break;
			case 46: for (int j = 0; j < 100; j++) sum++; break;
			case 47: for (int j = 0; j < 100; j++) sum++; break;
			case 48: for (int j = 0; j < 100; j++) sum++; break;
			case 49: for (int j = 0; j < 100; j++) sum++; break;
			case 50: for (int j = 0; j < 100; j++) sum++; break;
			case 51: for (int j = 0; j < 100; j++) sum++; break;
			case 52: for (int j = 0; j < 100; j++) sum++; break;
			case 53: for (int j = 0; j < 100; j++) sum++; break;
			case 54: for (int j = 0; j < 100; j++) sum++; break;
			case 55: for (int j = 0; j < 100; j++) sum++; break;
			case 56: for (int j = 0; j < 100; j++) sum++; break;
			case 57: for (int j = 0; j < 100; j++) sum++; break;
			case 58: for (int j = 0; j < 100; j++) sum++; break;
			case 59: for (int j = 0; j < 100; j++) sum++; break;
			case 60: for (int j = 0; j < 100; j++) sum++; break;
			case 61: for (int j = 0; j < 100; j++) sum++; break;
			case 62: for (int j = 0; j < 100; j++) sum++; break;
			case 63: for (int j = 0; j < 100; j++) sum++; break;
			case 64: for (int j = 0; j < 100; j++) sum++; break;
			case 65: for (int j = 0; j < 100; j++) sum++; break;
			case 66: for (int j = 0; j < 100; j++) sum++; break;
			case 67: for (int j = 0; j < 100; j++) sum++; break;
			case 68: for (int j = 0; j < 100; j++) sum++; break;
			case 69: for (int j = 0; j < 100; j++) sum++; break;
			case 70: for (int j = 0; j < 100; j++) sum++; break;
			case 71: for (int j = 0; j < 100; j++) sum++; break;
			case 72: for (int j = 0; j < 100; j++) sum++; break;
			case 73: for (int j = 0; j < 100; j++) sum++; break;
			case 74: for (int j = 0; j < 100; j++) sum++; break;
			case 75: for (int j = 0; j < 100; j++) sum++; break;
			case 76: for (int j = 0; j < 100; j++) sum++; break;
			case 77: for (int j = 0; j < 100; j++) sum++; break;
			case 78: for (int j = 0; j < 100; j++) sum++; break;
			case 79: for (int j = 0; j < 100; j++) sum++; break;
			case 80: for (int j = 0; j < 100; j++) sum++; break;
			case 81: for (int j = 0; j < 100; j++) sum++; break;
			case 82: for (int j = 0; j < 100; j++) sum++; break;
			case 83: for (int j = 0; j < 100; j++) sum++; break;
			case 84: for (int j = 0; j < 100; j++) sum++; break;
			case 85: for (int j = 0; j < 100; j++) sum++; break;
			case 86: for (int j = 0; j < 100; j++) sum++; break;
			case 87: for (int j = 0; j < 100; j++) sum++; break;
			case 88: for (int j = 0; j < 100; j++) sum++; break;
			case 89: for (int j = 0; j < 100; j++) sum++; break;
			case 90: for (int j = 0; j < 100; j++) sum++; break;
			case 91: for (int j = 0; j < 100; j++) sum++; break;
			case 92: for (int j = 0; j < 100; j++) sum++; break;
			case 93: for (int j = 0; j < 100; j++) sum++; break;
			case 94: for (int j = 0; j < 100; j++) sum++; break;
			case 95: for (int j = 0; j < 100; j++) sum++; break;
			case 96: for (int j = 0; j < 100; j++) sum++; break;
			case 97: for (int j = 0; j < 100; j++) sum++; break;
			case 98: for (int j = 0; j < 100; j++) sum++; break;
			case 99: for (int j = 0; j < 100; j++) sum++; break;
		}
	}
}


