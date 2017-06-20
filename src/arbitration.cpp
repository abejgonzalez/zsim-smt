/** arbitration.h
 * Date: June 19th, 2017
 * Authors: 
 * 	Abraham Gonzalez,
 * 	Barak Lidsky,
 * 	Ronald Macmaster,
 * 	Justin Nguyen,
 *	Ryan Syed
 *
 * Collection of arbitration unit methods to implement SMT.
 * Arbitration unit methods add cycle delays to simulate penalties
 * 1) before the fetch unit,
 * 2) before the reservation stations,
 * 3) before the execution stage. (unecessary?)
 *
 */

#include "arbitration.h"
#include "stdio.h"
#include <sstream>
#include <iterator>
#include <mutex>
#include <vector>
#include <algorithm>

Arbitration::Arbitration(/* two instruction trace pointers, bias */){
	this->cyclePenalty = 1;
	this->bias = 0;
}

/**
 * calculates the cycle delay pre-execution.
 * advances instruction traces accodringly.
 */
void Arbitration::arbitrateFetch(){
	printf("method: arbitrateFetch. \n");
}

/**
 * arbitrate rstation entry from reorder buffer.
 */
void Arbitration::arbitrateReservation(){
	printf("method: arbitrateReservation. \n");
}

/**
 * TODO: document
 */
void Arbitration::arbitrateExecution(){
	printf("method: arbitrateExecution. \n");
}

void Arbitration::addProcess(int pid){
	lock.lock();
	pids.push_back(pid);
	lock.unlock();
}

/** Debugging methods. **/

/**
 * prints the current arbitration set to the screen as a list. 
 */
void Arbitration::printWorkingSet(){
	printf("method: printWorkingSet. \n");
	if(pids.empty()){printf("bad pids vector!!!\n"); return;}
	std::stringstream ss;
	std::copy(pids.begin(), pids.end() - 1, std::ostream_iterator<int>(ss, ", "));
	ss << pids.back();

	printf("[ %s ]\n", ss.str().c_str());
}

