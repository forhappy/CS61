/*
 * =====================================================================================
 *
 *       Filename:  test-4-tls.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  04/22/2011 03:39:42 PM
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
#include <stdlib.h>
#include <unistd.h>

__thread int shared = 0;
pthread_mutex_t ss_mutex = PTHREAD_MUTEX_INITIALIZER;
int ss = 1;

void *thread_function1(void *arg) {
  int i;
  shared = 111;
  for ( i=0; i<20; i++ ) {
    printf("Thread1 says hi!\n");

	pthread_mutex_lock(&ss_mutex);
	ss ++;
	pthread_mutex_unlock(&ss_mutex);

	printf("ss(%p):%d\n", &ss, ss);
	printf("shared(%p) in thread1 %d\n",&shared, shared);
    sleep(1);
  }
  return NULL;
}

void *thread_function2(void *arg) {
  int i;
  shared = 222;
  for ( i=0; i<20; i++ ) {
    printf("Thread2 says hi!\n");

	pthread_mutex_lock(&ss_mutex);
	ss ++;
	pthread_mutex_unlock(&ss_mutex);

	printf("ss(%p):%d\n", &ss, ss);
	printf("shared(%p) in thread2 %d\n", &shared, shared ++);
    sleep(1);
  }
  return NULL;
}

void *thread_function3(void *arg) {
  int i;
  shared = 333;
  int *p = &shared;
  for ( i=0; i<20; i++ ) {
    printf("Thread3 says hi!\n");

	pthread_mutex_lock(&ss_mutex);
	ss ++;
	pthread_mutex_unlock(&ss_mutex);

	printf("ss(%p):%d\n", &ss, ss);
	printf("shared(%p) in thread3 %d\n", p, shared --);
    sleep(1);
  }
  return NULL;
}
int main(void) {

  pthread_t mythread1, mythread2, mythread3;
  
  shared ++;
  printf("shared(%p) in main thread %d\n", &shared, shared);
  if ( pthread_create( &mythread1, NULL, thread_function1, NULL) ) {
    printf("error creating thread.");
    abort();
  }

  if ( pthread_create( &mythread2, NULL, thread_function2, NULL) ) {
    printf("error creating thread.");
    abort();
  }

  if ( pthread_create( &mythread3, NULL, thread_function3, NULL) ) {
    printf("error creating thread.");
    abort();
  }

  for (int i = 0; i < 30; i ++) {
	  printf("shared(%p) in main thread %d\n", &shared, shared ++);
	  sleep(1);
  }
  if ( pthread_join ( mythread1, NULL ) ) {
    printf("error joining thread.");
    abort();
  }

  if ( pthread_join ( mythread3, NULL ) ) {
    printf("error joining thread.");
    abort();
  }

  if ( pthread_join ( mythread2, NULL ) ) {
    printf("error joining thread.");
    abort();
  }
  exit(0);
}
