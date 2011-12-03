// kcoroutine.cpp : 定义控制台应用程序的入口点。
//
#include "uthread.h"
#include "thread.h"
#include <stdio.h>
using namespace std;
sigset_t globalset;
class runable_test : public uthread_runnable
{
public:
	runable_test(const char *name):name(name){}
	void main_routine()
	{
		unsigned long c = 0;
		while(1)
		{
			//if(c % 10000 == 0)
			//	printf("%s\n",name);
		    //	++c;
			//u_thread::sleep(uid,1);
			//printf("%s wake up\n",name);
		}
	}
	const char *name;
	uthread_id uid;
};
class uthreadRunner : public runnable
{
public:
	bool run()
	{
		//初始化信号
		struct sigaction sigusr1;
		sigusr1.sa_flags = 0;
		sigusr1.sa_handler = int_signal_handler;
		sigemptyset(&sigusr1.sa_mask);
		int status = sigaction(SIGUSR1,&sigusr1,NULL);
		if(status == -1)
		{
			printf("error sigaction\n");
			return false;
		}
 
		//首先初始化调度器
		Scheduler::scheduler_init();
	
	
		runable_test t1("0");
		runable_test t2("1");
		runable_test t3("2");
		runable_test t4("3");
	
		//创建4个用户级线程
		t1.uid = Scheduler::uthread_create(&t1,4096);
		t2.uid = Scheduler::uthread_create(&t2,4096);
		t3.uid = Scheduler::uthread_create(&t3,4096);
		t4.uid = Scheduler::uthread_create(&t4,4096);
	
		printf("create finish\n");
		//开始调度线程的运行
		Scheduler::schedule();
	}
};

int main()
{
	sigemptyset(&globalset);
	sigaddset(&globalset,SIGUSR1);
	
	//首先创建运行coroutine的线程
	uthreadRunner ur;
	Thread c(&ur);
	c.start();
	//创建心跳中断线程
	beat b(200);
	b.addTread(c.GetId());
	b.loop();
	return 0;
}
