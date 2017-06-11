/** arbitration.h
 * Date: June 11th, 2017
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

#ifndef ARBITRATION_H
#define ARBITRATION_H

class Arbitration {

	// A1: pre-fetch
	// pointers to two instruction traces. 
	// advance pointers according to selection.
	//
	// A2: pre-rstation
	// arbitrate rstation entry from reorder buffer.
	// 
	// A3: pre-execution (TODO)
	//
	//
	
  private: 

	int bias; // range, (0,1) -> (t1, t2). 0.5 is fair.
	int cyclePenalty;
	
  public:
	
	Arbitration(/* two instruction trace pointers */);
	Arbitration(/* two instruction trace pointers, bias */);

	/**
	 * calculates the cycle delay pre-execution.
	 * advances instruction traces accodringly.
	 */
	void arbitrateFetch();

	/**
	 * arbitrate rstation entry from reorder buffer.
	 */
	void arbitrateReservation();

	/**
	 * TODO: document
	 */
	void arbitrateExecution();

};

#endif
