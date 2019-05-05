#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[])
{

    pid_t pid = fork();

    if (pid < 0)
    {
        perror("Fork failed\n");
    }

    if (pid == 0)
    {
        printf("Hello, World!\n");
        exit(0);
    }

    //must be the parent
    waitpid(pid, NULL, 0);
    printf("The child and the parent process ids are: %d and %d\n", pid, (int)getpid());
    return 0;
}