#include <pthread.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int NUM_OF_THREADS = 4;

void *runner(void *param); 
int main(int argc, char *arg[]) {
    
    pthread_t threads[NUM_OF_THREADS];
    pthread_attr_t attr[NUM_OF_THREADS];
    int rc;
    for(int x = 0;x<NUM_OF_THREADS;x++) {
        pthread_attr_init(&attr[x]);
        pthread_create(&threads[x], &attr[x], runner, NULL);
        if(rc) {
            printf("ERROR: error code returned from pthread_create() is %d\n", rc);
            return(-1);
        }
    }

    for(int x =0;x<NUM_OF_THREADS;x++) {
        pthread_join(threads[x], NULL);  
    }
}

void *runner(void *param) {
    long id = pthread_self();
    printf("Hello, World! from thread id: %ld\n", id);
    
    pthread_exit(0);
}