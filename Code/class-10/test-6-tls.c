#include <malloc.h>
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

pthread_key_t thread_log_key;

/*通用函数里可以利用 pthread_getspecific() 处理线程各自的私有数据*/
void write_to_thread_log (const char *message)
{
    FILE *thread_log = (FILE *)pthread_getspecific (thread_log_key);
    fprintf (thread_log, "%s\n", message);
}

void close_thread_log (void *thread_log)
{
    fclose ((FILE *)thread_log);
}

void *thread_function (void *args)
{
    char thread_log_filename[128];
    char thread_start_message[128];

    FILE *thread_log;

    sprintf (thread_log_filename, "thread%u.log", pthread_self());

    thread_log = fopen (thread_log_filename, "w");

    pthread_setspecific (thread_log_key, thread_log); //每个线程都设置自己的私有数据

    sprintf (thread_start_message, "thread %u starting", pthread_self());
    write_to_thread_log (thread_start_message);  

    pthread_exit(NULL);
}

int main()
{
    int i;
    pthread_t threads[5];

        /*创建私有数据键,close_thread_log 在线程退出时对 key 关联数据进行清理*/
    pthread_key_create (&thread_log_key, close_thread_log);  
    
    for (i = 0; i < 5; i++) 
        pthread_create (&threads[i], NULL, thread_function, NULL); //创建多线程
    
    for (i = 0; i < 5; i++)
        pthread_join (threads[i], NULL);  //等待各个线程结束

    return (0);
}
