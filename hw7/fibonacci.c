#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    printf("%d\n", argc);
    int fibSize = 0;
    if (argc == 2 && (int)(*argv[1] - '0') > 0)
    {
        fibSize = (int)(*argv[1] - '0');
    }
    else
    {
        perror("Wrong number of arguments");
        return -1;
    }
    printf("Fibsize: %d\n", fibSize);
    pid_t pid = fork();

    if (pid < 0)
    {
        perror("Fork failed\n");
    }

    if (pid == 0)
    {
        printf("Hello, World!\n");
        //base case
        if (fibSize <= 1 && fibSize >= 0)
        {
            printf("%d", fibSize);
            exit(0);
        }
        else
        {
            //fork it fibSize - 1
            //fork it fibsize -2
        }
        exit(0);
    }

    //must be the parent
    waitpid(pid, NULL, 0);
    printf("The child and the parent process ids are: %d and %d\n", pid, (int)getpid());
    return 0;
}