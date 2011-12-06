/* 
 * xasm/futex.h
 * by WN @ Oct. 20, 2010
 */

/* wrapper of correponding futex system calls */

#ifndef __X86_FUTEX_H
#define __X86_FUTEX_H

#include <defs.h>

extern int
futex_wait(void * addr, int val);

extern int
futex_wake(void * addr, int nr);

#endif

// vim:ts=4:sw=4

