#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>

#define NITER 1000000

int count = 0;

void * ThreadAdd(void * a)
{
    int i, tmp;
    for(i = 0; i < NITER; i++)
    {
        tmp = count;      /* copy the global count locally */
        tmp = tmp+1;      /* increment the local copy */
        count = tmp;      /* store the local value into the global count */ 
    }
}

int main(int argc, char * argv[])
{
    pthread_t tid1, tid2;

    if(pthread_create(&tid1, NULL, ThreadAdd, NULL))
    {
      printf("\n ERROR creating thread 1");
      exit(1);
    }

    if(pthread_create(&tid2, NULL, ThreadAdd, NULL))
    {
      printf("\n ERROR creating thread 2");
      exit(1);
    }

    if(pthread_join(tid1, NULL))	/* wait for the thread 1 to finish */
    {
      printf("\n ERROR joining thread");
      exit(1);
    }

    if(pthread_join(tid2, NULL))        /* wait for the thread 2 to finish */
    {
      printf("\n ERROR joining thread");
      exit(1);
    }

    if (count < 2 * NITER) 
        printf("\n BOOM! count is [%d], should be %d\n", count, 2*NITER);
    else
        printf("\n OK! count is [%d]\n", count);
  
    pthread_exit(NULL);
}


