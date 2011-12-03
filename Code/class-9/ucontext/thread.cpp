// C++ source file
// Author:   root
// File:     /mnt/win-c/IOCP/thread.cpp
// Created:  16:08:50 2008-05-10
// Modified: 08:34:42 2008-05-11
// Brief:     

#include "thread.h"

bool Thread::start()
{
	pthread_attr_t attr;
	pthread_attr_init(&attr);
	if(isjoinable)
		pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_JOINABLE);
	else
		pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_DETACHED);
	pthread_create(&id,&attr,threadFun,(void*)this->_runnable);
	pthread_attr_destroy(&attr);
}
