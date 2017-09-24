#include <stdio.h>
#include <random>

int count;
int cycles;
float priority;
char core[4];
int value = 0x77;

class thread {
    public:
    float priority;
    const float inst_fetch = 0.80;
    char sym; 
    void setpriority (float);
    void setchar (char);
};

void thread::setpriority(float x){
    priority = x;
}
void thread::setchar(char x){
    sym = x;
}
void excount(char *core, int *execution){
    for (int i = 0; i < count; i++){
        switch (core[i]) {
            case 'w' : execution[0] += 1;
                       break;
            case 'x' : execution[1] += 1;
                       break;
            case 'y' : execution[2] += 1;
                       break;
            case 'z' : execution[3] += 1;
                       break;
        }
    }
}

char arbitrate(thread *threads){
    char x = 0;
    while (x == 0){
        //float h = rand();
        //h = (h % 100) + 1;
        if (count == 4){
            if ((rand() % 100)  < 33){                      
                if ((rand() % 100) <= 100*threads[1].priority){
                    x = threads[1].sym;
                }
            }
            else if ((rand() % 100) < 50){ 
                if ((rand() % 100) <= 100*threads[2].priority){
                    x = threads[2].sym;
                }
            }
            else { 
                if ((rand() % 100) <= 100*threads[3].priority){
                    x = threads[3].sym;
                }
            }
        }
        else { 
            if ((rand() % 100) <= 100*threads[1].priority){
                x = threads[1].sym;
            }
        }
    }
    return (x);
}


int main(){
    printf("How many threads to run(2 or 4): ");
    scanf("%d", &count);
    printf("Priority of main thread is: ");
    scanf("%f", &priority);
    printf("How many cycles: ");
    scanf("%d", &cycles);
    thread threads[count];
    int execution[count];
    if (count > 2){
        execution[0] = 0;
        execution[1] = 0;
        execution[2] = 0;
        execution[3] = 0;
        
    }
    else {
        execution[0] = 0;
        execution[1] = 0;
    }
    for (int i = 0; i < count; i++){
        if (i == 0){
            threads[i].setpriority(priority);
            threads[i].setchar(value);
        }
        else {
            threads[i].setpriority( (1-priority)/(count - 1));
            threads[i].setchar(value);
        }
        value += 1;
    }
    //printf("%c %c %c %c\n", threads[0].sym, threads[1].sym, threads[2].sym, threads[3].sym);
    printf("Each column is an execution of an instruction\n");
    printf("%d execution units for this simulation\n\n", count);
    while (cycles) {
        printf("| ");
        for (int j = 0; j < count; j++){
             float h = rand() % 100;
             //printf("%f\n", h);   A
             //std::cout << h << std::endl;
             if ((rand() % 100) <= 100*threads[0].priority){
                //printf("made it\n");
                if ( (rand() % 100) <= 100*threads[0].inst_fetch){
                    core[j] = threads[0].sym;
                }
                else {
                    core[j] = arbitrate(threads);
                }
             }
             else {
                 core[j] = arbitrate(threads);
             }
             printf("%c ", core[j]);
        }
        //printf("%d\n", cycles);
        printf("|\n");
        excount(core, execution); 
        cycles -= 1 ;
    }
    
    printf("main thread: %c  latency-non-critical threads: %c %c %c\n", threads[0].sym, threads[1].sym, threads[2].sym, threads[3].sym);
    printf("Number of Instructions Run for each Thread\n");
    printf("w: %d ", execution[0]);
    printf("x: %d ", execution[1]);
    if (count > 2){
        printf("y: %d ", execution[2]);
        printf("z: %d\n", execution[3]);
        printf("Total instructions run: %d\n", (execution[0]+execution[1]+execution[2]+execution[3]));
    }
    else {
        printf("Total instructions run: %d\n", (execution[0]+execution[1]));
    }
    return 0;
}
