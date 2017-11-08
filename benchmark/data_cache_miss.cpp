#include <random>
#include "stdio.h"

#define MAX_SIZE 1000000

int main() {

	int x[MAX_SIZE];

	std::default_random_engine generator;
	std::uniform_int_distribution<int> distribution(0,MAX_SIZE);

	for (int i=0; i<1000; ++i) {
		int number = distribution(generator);
		x[number] = distribution(generator);
	}
}

