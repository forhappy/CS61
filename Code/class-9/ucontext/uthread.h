/*
* brief: 用ucontext实现的用户级线程框架
* author: kenny huang
* date: 2009/10/13
* email: huangweilook@21cn.com
*/
#ifndef _UTHREAD_H
#define _UTHREAD_H
#include <ucontext.h>
#include <stdio.h>
#include <string.h>
#include <list>
#include <pthread.h>
#include <signal.h>
#include <unistd.h>
#define MAX_UTHREAD 128
typedef int uthread_id;
#define INVAID_ID -1
void int_signal_handler(int sig);
//用户态线程的当前状态
enum thread_status
{
    ACTIVED = 0,//可运行的
	BLOCKED,//被阻塞
	SLEEP,//主动休眠
	DIE,//死死亡
};

class uthread_runnable
{
public:
	virtual void main_routine() = 0;
};
class Scheduler;
/*
* 用户态线程
*/
class u_thread
{
	friend class Scheduler;
private:
	u_thread(uthread_runnable *rable,unsigned int ssize,uthread_id uid)
		:ssize(ssize),_status(BLOCKED),rable(rable),uid(uid)
		{
			stack = new char[ssize];
			ucontext.uc_stack.ss_sp = stack;
			ucontext.uc_stack.ss_size = ssize;
			getcontext(&ucontext);
		}
	~u_thread()
	{
		delete []stack;
	}
	static void star_routine();
    
public:
	ucontext_t &GetContext()
	{
		return ucontext;
	}
	void SetStatus(thread_status _status)
	{
		this->_status = _status;
	}
	thread_status GetStatus()
	{
		return _status;
	}
	uthread_id GetUid()
	{
		return uid;
	}
	//休眠time时间
	static void sleep(uthread_id utid,int t);
    
private:
	ucontext_t ucontext;
	char *stack;//coroutine使用的栈
	unsigned int ssize;//栈的大小
	thread_status _status;
	uthread_runnable *rable;
	uthread_id uid;
};
/*
* 任务调度器
*/
class Scheduler
{
	//friend void u_thread::star_routine();
	friend class u_thread;
public:
	static void scheduler_init();
	static void schedule();
	static uthread_id uthread_create(uthread_runnable *rable,unsigned int stacksize);
	static void int_sig();
private:
	static u_thread *GetCurrentUThread()
	{
		if(current == -1)
			return NULL;
		return threads[current];
	}
	//休眠time时间
	static void sleep(uthread_id utid,int t);
private:
	static std::list<u_thread*> activeList;//可运行uthread列表
	
	static std::list<std::pair<u_thread*,time_t> > sleepList;//正在睡眠uthread列表
	
	static  char stack[4096];
	
	static 	ucontext_t ucontext;//Scheduler的context
	static  ucontext_t* p_curcontext;//指向当前正在使用的context 
	
	static  u_thread *threads[MAX_UTHREAD];
	static  int total_count;
	static  int current;//在uthread创建时使用的
};
/*心跳发射器，发射器必须运行在一个独立的线程中，以固定的间隔
* 往所有运行着coroutine的线程发送中断信号
*/
class beat
{
public:
	beat(unsigned int interval):interval(interval)
	{}
	void addTread(pthread_t id)
	{
		allthread.push_back(id);
	}
	void loop()
	{
		while(true)
		{
			//每隔固定时间向所有线程发中断信号
			::usleep(1000 * interval);
			std::list<pthread_t>::iterator it = allthread.begin();
			std::list<pthread_t>::iterator end = allthread.end();
			for( ; it != end ;++it)
			{
				pthread_kill(*it,SIGUSR1);
			}
		}
	}
private:
	unsigned int interval;//发送中断的间隔(豪秒)
	std::list<pthread_t> allthread;
};
#endif
