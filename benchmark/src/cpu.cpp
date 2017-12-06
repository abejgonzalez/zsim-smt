#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <unistd.h>

#include <pthread.h>

#include "benchmark.h"

#define NUM_THREADS 2

pthread_t threads[NUM_THREADS];

/**
 * Set the current process's virtual CPU.
 */
int set_cpu(int cpu_id) {
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(cpu_id, &set);

    if (sched_setaffinity(getpid(), sizeof(set), &set) < 0)
        printf("Could not set the CPU of this process to CPU %d\n", cpu_id);
	return cpu_id;
}


/**
 * Set the current pthread's virtual CPU.
 */
int set_thread_cpu(int cpu_id) {
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(cpu_id, &set);

    if (pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &set) < 0)
        printf("Could not set the CPU of this thread to CPU %d\n", cpu_id);
    return cpu_id;
}


int main(int argc, char ** argv) {

	int option; // command line options
	enum { MT_SMT, MT_COARSE } mt_mode = MT_COARSE;
	while ((option = getopt(argc, argv, "s")) != -1) {
		switch (option) {
			case 's': mt_mode = MT_SMT;
		}
	}

	// parse benchmark
	void * (*benchmark)(void *);
	if (argc <= optind) {
		printf("usage: %s [-s] benchmark\n", argv[0]);
		exit(1);
	} else if (!strcmp(argv[optind], "branch_miss")) {
		benchmark = dcache_good;
	} else if (!strcmp(argv[optind], "dcache_good")) {
		benchmark = dcache_good;
	} else if (!strcmp(argv[optind], "dcache_miss")) {
		benchmark = dcache_good;
	} else if (!strcmp(argv[optind], "icache_good")) {
		benchmark = dcache_good;
	} else {
		printf("usage: %s [-s] [branch_[good|miss]|dcache_[good|miss]|icache_[good|miss]]\n", argv[0]);
		exit(1);
	}

	// execute benchmark threads
    for (int i = 0; i < NUM_THREADS; ++i) {
        int cpid = mt_mode == MT_SMT ? i : 0;
        pthread_create(&threads[i], NULL, benchmark, (void *) cpid);
    }

    for (int i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
    }
}
