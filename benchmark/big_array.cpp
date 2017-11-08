#include <iostream>
#include <stdlib.h>
#include <ctime>

/*
 * This program supposedly causes a large amount of data
 * cache misses. It does this by performing random accesses into
 * a VERY large array
 * NOTE: DO NOT COMPILE WITH OPTIMIZATIONS
 */

int main() {
    const unsigned array_size = 65536;
    int big_array[array_size];

    // init array
    for (int c = 0; c < array_size; c++) {
        big_array[c] = c * 2;
    }

    int sum = 0;
    clock_t start = clock();
    for (int x = 0; x < 2000000000; x++) {
        int index = rand() % array_size;
        sum += big_array[index];
    }

    double elapsed_time = static_cast<double>(clock() - start) / CLOCKS_PER_SEC;
    std::cout << "Elapsed Time: " << elapsed_time << "s" << std::endl;
    std::cout << "Sum: " << sum << std::endl;
}
