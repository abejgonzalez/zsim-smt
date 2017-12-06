#ifndef BENCHMARK_H
void * branch_good(void * arg);
void * branch_miss(void * arg);
void * dcache_good(void * arg);
void * dcache_miss(void * arg);
void * icache_good(void * arg);
void * icache_miss(void * arg);
#endif
