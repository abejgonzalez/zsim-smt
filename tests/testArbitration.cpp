#include "arbitration.h"
#include <unistd.h>

void testFairArbitration();
void testPrintWorkingSet();

int main(){
	testFairArbitration();
	testPrintWorkingSet();
}

void testFairArbitration(){
	return;
}

void testPrintWorkingSet(){
	Arbitration unit;
	int cpid = getpid();
	for(int i = 0; i < 10; i++){
		if(cpid = fork())
			unit.addProcess(cpid);
		else
			break;
	}
	
	if(cpid){
		printf("parent process: %d \n", getppid());
		printf("this process: %d \n", getpid());
		unit.printWorkingSet();
	}
}



