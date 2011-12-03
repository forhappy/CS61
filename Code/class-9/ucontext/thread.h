// C/C++ header file
// Author:   root
// File:     /mnt/win-c/project/include/thread.h
// Created:  16:18:04 2008-05-04
// Modified: 08:39:43 2008-05-11
// Brief:     
#ifndef _THREAD_H
#define _THREAD_H
#include <pthread.h>
#include <utility>
#include <list>
#include <deque>
#include <stdio.h>
#include <iostream>
#include <string.h>
#include <time.h>
#include <vector>
#include <sys/time.h>
/*
 *可执行接口
*/
struct runnable
{
	public:
		runnable():terminated(false){}
		virtual bool run() = 0;
		virtual void setTerminate()
		{
			printf("runnable terminated\n");
			terminated = true;
		}
		bool isTerminate()
		{
			return terminated;
		}
		void clearTerminate()
		{
			terminated = false;
		}
	protected:
			volatile bool terminated;
};

class Thread 
{
	public:
		Thread(runnable *_runnable,std::string name="kenny",bool _isjoinable=true)
			:name(name),_runnable(_runnable),isjoinable(_isjoinable)
		{
		}
		Thread(std::string name="kenny",bool _isjoinable = true):name(name),isjoinable(_isjoinable){}
		void setRunnable(runnable *_runnable)
		{
			this->_runnable = _runnable;
		}

		~Thread()
		{
			/*if(_runnable)
				delete _runnable;
			_runnable = NULL;
			*/
		}
		bool start();
		static void *threadFun(void* arg)
		{
			runnable *r = (runnable*)arg;
			r->run();
		}
		void join()
		{
			if(isjoinable)
				::pthread_join(id, NULL);
		}
		bool isJoinable()
		{
			return isjoinable;
		}
		void setTerminate()
		{
			printf("thread setterminate %s\n",name.c_str());
			_runnable->setTerminate();
		}
		bool isTerminate()
		{
			return _runnable->isTerminate();
		}
		void clearTerminate()
		{
			_runnable->clearTerminate();
		}
				/**
		 * \brief 使当前线程睡眠指定的时间，秒
		 *
		 *
		 * \param sec 指定的时间，秒
		 */
		static void sleep(const long sec)
		{
			::sleep(sec);
		}
		/**
		 * \brief 使当前线程睡眠指定的时间，毫秒
		 *
		 *
		 * \param msec 指定的时间，毫秒
		 */
		static void msleep(const long msec)
		{
			::usleep(1000 * msec);
		}
		/**
		 * \brief 使当前线程睡眠指定的时间，微秒
		 *
		 *
		 * \param usec 指定的时间，微秒
		 */
		static void usleep(const long usec)
		{
			::usleep(usec);
		}
		
		/**
		 * \brief 使当前线程睡眠指定的时间，纳秒
		 *
		 *
		 * \param nsec 指定的时间，纳秒
		 */
		static void nanosleep(const long nsec)
		{
			struct timespec req;
			req.tv_sec =  nsec / 1000000000;
			req.tv_nsec = nsec;
			::nanosleep(&req, NULL);
		}
		pthread_t GetId()
		{
			return id;
		}
	protected:
		runnable *_runnable;
		pthread_t id;
		bool isjoinable;
		std::string name;

};
#endif

