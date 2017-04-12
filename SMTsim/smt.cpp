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
    printf("Each column is an exeuction of an instruction\n");
    printf("%d execution units for this simulation\n", count);
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
        
        cycles -= 1 ;
    }
    
    printf("main thread: %c  latency-non-critical threads: %c %c %c\n", threads[0].sym, threads[1].sym, threads[2].sym, threads[3].sym);
    return 0;
}
