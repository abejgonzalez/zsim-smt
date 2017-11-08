#include <random>
#include "stdio.h"
#include <ctime>
#include <iostream>

#define MAX_SIZE 1000000

int main() {

	int x[MAX_SIZE];

	std::default_random_engine generator;
	std::uniform_int_distribution<int> distribution(0,MAX_SIZE);

    clock_t start = clock();

    for (int k=0; k<MAX_SIZE; k++) {
        x[k] = distribution(generator);
    }

    int sum = 0;
    int running_avg = 0;
    int plus_two, idk, idk2_electric_boogaloo;
    int times_3p2;
	for (int i=1; i<=1000; ++i) {
        int val = x[distribution(generator)];

        sum += val;
        running_avg = sum / i;

        plus_two = running_avg + 2;
        std::cout << plus_two << std::endl;
        
        times_3p2 = (int) plus_two * 3;
        std::cout << times_3p2 << std::endl;

        idk = (int) (times_3p2 / 4);
        std::cout << idk << std::endl;

        idk2_electric_boogaloo = (idk + 2) * 4 - 3;
        std::cout << idk2_electric_boogaloo << std::endl;

        plus_two = running_avg + 3;
        std::cout << plus_two << std::endl;
        
        times_3p2 = (int) plus_two * 4;
        std::cout << times_3p2 << std::endl;

        idk = (int) (times_3p2 / 5);
        std::cout << idk << std::endl;

        idk2_electric_boogaloo = (idk + 3) * 4 - 3;
        std::cout << idk2_electric_boogaloo << std::endl;

        plus_two = running_avg + 4;
        std::cout << plus_two << std::endl;
        
        times_3p2 = (int) plus_two * 5;
        std::cout << times_3p2 << std::endl;

        idk = (int) (times_3p2 / 5);
        std::cout << idk << std::endl;

        idk2_electric_boogaloo = (idk + 3) * 4 - 3;
        std::cout << idk2_electric_boogaloo << std::endl;

        plus_two = running_avg + 5;
        std::cout << plus_two << std::endl;
        
        times_3p2 = (int) plus_two * 6;
        std::cout << times_3p2 << std::endl;

        idk = (int) (times_3p2 / 5);
        std::cout << idk << std::endl;

        idk2_electric_boogaloo = (idk + 3) * 4 - 3;
        std::cout << idk2_electric_boogaloo << std::endl;

        plus_two = running_avg + 6;
        std::cout << plus_two << std::endl;
        
        times_3p2 = (int) plus_two * 7;
        std::cout << times_3p2 << std::endl;

        idk = (int) (times_3p2 / 5);
        std::cout << idk << std::endl;

        idk2_electric_boogaloo = (idk + 3) * 4 - 3;
        std::cout << idk2_electric_boogaloo << std::endl;

        plus_two = running_avg + 7;
        std::cout << plus_two << std::endl;
        
        times_3p2 = (int) plus_two * 8;
        std::cout << times_3p2 << std::endl;

        idk = (int) (times_3p2 / 5);
        std::cout << idk << std::endl;

        idk2_electric_boogaloo = (idk + 3) * 4 - 3;
        std::cout << idk2_electric_boogaloo << std::endl;

        std::cout << "Sum: " << sum << " Avg: " << running_avg << std::endl;
	}
    
    double elapsed_time = static_cast<double>(clock() - start) / CLOCKS_PER_SEC;
    std::cout << "Elapsed Time: " << elapsed_time << std::endl;
}

