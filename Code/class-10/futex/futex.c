/* 
 * futex.c
 * by WN @ Oct. 22, 2010
 */

#include <linux/kernel.h>
#include <linux/futex.h>

#include <xasm/asm_syscall.h>
#include <xasm/futex.h>

int
futex_wait(void * addr, int val)
{
	return INTERNAL_SYSCALL_int80(futex, 6,
			(uintptr_t)addr, FUTEX_WAIT_PRIVATE, val, NULL, NULL, NULL);
}

int
futex_wake(void * addr, int nr)
{
	return INTERNAL_SYSCALL_int80(futex, 6,
			(uintptr_t)addr, FUTEX_WAKE_PRIVATE, nr, NULL, NULL, 0);
}

// vim:ts=4:sw=4

