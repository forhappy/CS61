/*
 * =============================================================================
 *
 *       Filename:  sem-example-good.c
 *
 *    Description:  sem good example
 *
 *        Version:  0.0.1
 *        Created:  12/06/2011 10:32:51 AM
 *       Revision:  r1
 *       Compiler:  gcc (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5
 *
 *         Author:  Fu Haiping (forhappy), haipingf@gmail.com
 *        Company:  ICT ( Institute Of Computing Technology, CAS )
 *
 * =============================================================================
 */
#include <semaphore.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

int main(int argc, char **argv)
{
  int fd, i,count=0,nloop=10,zero=0,*ptr;
  sem_t *mutex;
  int shm;

  //open a file and map it into memory
if ((shm = shm_open("myshm", O_RDWR | O_CREAT, S_IRWXU)) < 0) {
    perror("shm_open");
    exit(1);
  }

  if ( ftruncate(shm, sizeof(sem_t)) < 0 ) {
    perror("ftruncate");
    exit(1);
  }

  if ((mutex = mmap(NULL, sizeof(sem_t), PROT_READ | PROT_WRITE,
      MAP_SHARED, shm, 0)) == MAP_FAILED) {
    perror("mmap");
    exit(1);
  }

  if (sem_init(mutex, 1, 1) < 0) {
    perror("semaphore initialization");
    exit(1);
  }  
#if 0
  fd = open("log.txt",O_RDWR|O_CREAT,S_IRWXU);
  write(fd,&zero,sizeof(int));
  ptr = mmap(NULL,sizeof(int),PROT_READ |PROT_WRITE,MAP_SHARED,fd,0);
  close(fd);

  /* create, initialize semaphore */
  if( sem_init(&mutex,1,1) < 0)
    {
      perror("semaphore initilization");
      exit(0);
    }
#endif
  if (fork() == 0) { /* child process*/
    for (i = 0; i < nloop; i++) {
      sem_wait(mutex);
      printf("child entered crititical section: %d\n", (*ptr)++);
      sleep(2);
      printf("child leaving critical section\n");
      sem_post(mutex);
      sleep(1);
    }
    exit(0);
  }
  /* back to parent process */
  for (i = 0; i < nloop; i++) {
    sem_wait(mutex);
    printf("parent entered critical section: %d\n", (*ptr)++);
    sleep(2);
    printf("parent leaving critical section\n");
    sem_post(mutex);
    sleep(1);
  }
  exit(0);
}
