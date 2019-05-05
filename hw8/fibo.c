#include <pthread.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int NUM_OF_THREADS = 2;
int NUM = 0;
//results
void *runner(void *param);
void *fiboN(void *param);
int main(int argc, char *arg[])
{
    if(argc <= 1) {
        printf("You did not provide the necessary arguments. Exiting Program");
        exit(1);
    }

    NUM = atoi(arg[1]);
    pthread_t threads[NUM_OF_THREADS];
    pthread_attr_t attr[NUM_OF_THREADS];
    int rc;
    for (int x = 0; x < NUM_OF_THREADS; x++)
    {
        pthread_attr_init(&attr[x]);

        if (x == 0)
        {
            printf("Thread Sum Starting\n");
            rc = pthread_create(&threads[x], &attr[x], runner, NULL);
        }
        else
        {
            printf("Thread Fibonnacci Starting\n");
            rc = pthread_create(&threads[x], &attr[x], fiboN, NULL);
        }

        if (rc)
        {
            printf("ERROR: error code returned from pthread_create() is %d\n", rc);
            return (-1);
        }
    }

    for (int x = 0; x < NUM_OF_THREADS; x++)
    {
        pthread_join(threads[x], NULL);
    }
}

void *runner(void *param)
{
    int sum = 0;
    long id = pthread_self();
    for (int x = 0; x < NUM; x++)
    {
        sum += x;
    }
    printf("The sum of the first %d numbers is: %d", NUM, sum);

    printf("\nThread Sum Finished\n");
    pthread_exit(0);
}

void *fiboN(void *param)
{
    int fib[NUM];
    fib[0] = 0;
    fib[1] = 1;

    for (int x = 2; x < NUM; x++)
    {
        fib[x] = fib[x - 1] + fib[x - 2];
    }

    printf("The first %d numbers in the Fibonacci sequence are: ", NUM);
    for (int x = 0; x < NUM; x++)
    {
        printf("%d ", fib[x]);
    }
    printf("\nThread Fibonnacci Finished\n");
    pthread_exit(0);
}