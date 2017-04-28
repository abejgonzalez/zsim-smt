#include <unistd.h>
int main(){
    char *args[] = {"ls", "-l", 0};
    execvp(args[0], args);
}
