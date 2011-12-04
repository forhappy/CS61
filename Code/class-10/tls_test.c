#include <asm/ldt.h>
#include <stdio.h>
#include <linux/unistd.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <asm/sigcontext.h>
#include <syscall.h>
/*
 * TLS functionality testing utility.
 */
#define TLS_FLAGS_MASK                  0x00000003

#define TLS_FLAG_WRITABLE               0x00000001
#define TLS_FLAG_CLEAR                  0x00000002

#define __NR_set_thread_area 243

static inline void initseg (int seg)
{
	asm ("mov %w0,%%fs" : : "r" (seg));
}

static inline unsigned char __readseg (unsigned offset)
{
	unsigned char res;

	asm ("fs; movb (%1),%%al" : "=a" (res) : "r" (offset));

	return res;
}

static inline void __writeseg (unsigned offset, unsigned char b)
{
	asm ("fs; movb %b1,(%0)" : : "r" (offset), "r" (b));
}

static void readseg (void *dst, const void *src)
{
	*(char *)dst = __readseg((unsigned int)src);
}

static void writeseg (void *dst, unsigned char value)
{
	__writeseg((unsigned int)dst, value);
}

unsigned char pre_data		[4096] = { [ 0 ... 4095 ] = 33 };
unsigned char data		[4096] = { [ 0 ... 4095 ] = 44 };
unsigned char post_data		[4096] = { [ 0 ... 4095 ] = 55 };

int main (void)
{
	unsigned int base;
	int seg;
	unsigned char result;

	data[0] = 123;
	data[4096] = 210;

	base = 0;

	printf("\ndoing set_thread_area(0x%08x, writable):\n", base);
	seg = set_thread_area(base, TLS_FLAG_WRITABLE);
	printf("====> got GDT selector: 0x%x", seg);
	if (seg != 0xb) {
		printf(" ERROR: incorrect selector!\n");
		exit(-1);
	} else
		printf(" --- TEST PASSED.\n");

	initseg(seg);
	printf("\nreading first byte of [0x%08x] TLS:\n", base);

	readseg (&result, &data);
	if (result == 123)
		printf("====> %d --- TEST PASSED.\n\n", result);
	else
		printf("====> %d --- TEST FAILURE!\n\n", result);

	base = (unsigned int)&data;

	printf("doing set_thread_area(0x%08x, writable):\n", base);
	seg = set_thread_area(base, TLS_FLAG_WRITABLE);
	initseg(seg);
	printf("====> got GDT selector: 0x%x", seg);
	if (seg != 0xb) {
		printf(" ERROR: incorrect selector!\n");
		exit(-1);
	} else
		printf(" --- TEST PASSED.\n");

	printf("context-switching once ...\n");
	sleep(1);
	printf("\nreading first byte of 4K [0x%08x] TLS:\n", base);

	readseg (&result, 0);
	if (result == 123)
		printf("====> %d --- TEST PASSED.\n\n", result);
	else
		printf("====> %d --- TEST FAILURE!\n\n", result);

	printf("reading last byte of 4097 byte [0x%08x] TLS:\n", base);

	readseg (&result, (void *)4096);
	if (result == 210)
		printf("====> %d --- TEST PASSED.\n\n", result);
	else
		printf("====> %d --- TEST FAILURE!\n\n", result);

	printf("writing last byte of 4097 byte [0x%08x] TLS:\n", base);
	writeseg ((void *)4096, 234);
	readseg (&result, (void *)4096);
	if (result == 234)
		printf("====> %d --- TEST PASSED.\n", result);
	else
		printf("====> %d --- TEST FAILURE!.\n", result);

	printf("\nreading byte outside of the TLS (should not coredump)...\n\n");
	readseg (&result, (void *)4097);
	printf("result: %d.\n", result);

	return 0;
}
