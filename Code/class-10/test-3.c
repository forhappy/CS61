/*
 * =====================================================================================
 *
 *       Filename:  test-3.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  04/22/2011 03:36:55 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *        Company:  
 *
 * =====================================================================================
 */
#include <pthread.h>
#include <stdio.h>
#include <math.h>

#define ITERATIONS 10000

// A shared mutex
pthread_mutex_t mutex;
double target;

void* opponent(void *arg)
{
    for(int i = 0; i < ITERATIONS; ++i)
    {
        // Lock the mutex
        pthread_mutex_lock(&mutex);
        target -= target * 2 + tan(target);
        // Unlock the mutex
        pthread_mutex_unlock(&mutex);
    }

    return NULL;
}

int main(int argc, char **argv)
{
    pthread_t other;

    target = 5.0;

    // Initialize the mutex
    if(pthread_mutex_init(&mutex, NULL))
    {
        printf("Unable to initialize a mutex\n");
        return -1;
    }

    if(pthread_create(&other, NULL, &opponent, NULL))
    {
        printf("Unable to spawn thread\n");
        return -1;
    }


    for(int i = 0; i < ITERATIONS; ++i)
    {
        pthread_mutex_lock(&mutex);
        target += target * 2 + tan(target);
        pthread_mutex_unlock(&mutex);
    }

    if(pthread_join(other, NULL))
    {
        printf("Could not join thread\n");
        return -1;
    }

    // Clean up the mutex
    pthread_mutex_destroy(&mutex);

    printf("Result: %f\n", target);

    return 0;
}
