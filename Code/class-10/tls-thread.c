#include <asm/unistd_32.h>
#include <unistd.h>

#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <stdio.h>

struct user_desc
{
  unsigned int entry_number;
  unsigned long int base_addr;
  unsigned int limit;
  unsigned int seg_32bit:1;
  unsigned int contents:2;
  unsigned int read_exec_only:1;
  unsigned int limit_in_pages:1;
  unsigned int seg_not_present:1;
  unsigned int useable:1;
  unsigned int empty:25;
};
static char base[] = "1234\n";

int main()
{
	int err;
	struct user_desc desc;
	desc.entry_number = 1;
	desc.base_addr = (unsigned long)base;
	desc.limit = 4096;
	desc.seg_32bit = 1;
	desc.contents = 0;
	desc.read_exec_only = 0;
	desc.limit_in_pages = 0;
	desc.seg_not_present = 0;
	desc.useable = 1;


	err = syscall(__NR_modify_ldt, 0x11, &desc,sizeof(desc));

	asm volatile ("movw %w0, %%fs\n" :: "q" (desc.entry_number * 8 + 4 + 3));


	int tls_base;
	int tmp = 0x31323000;

	/* set tls base address */
	asm volatile ("movl %%ebx, %%fs:0x0\n"::"b"(tmp));

#if 0
	unsigned char * buf = mmap((void *)tmp, 4096, 1 | 2, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
	memset(buf, '1', 4095);
	buf[4095] = '\0';
#endif

	asm volatile ("movl %%fs:0x0, %%ecx\n" : "=c" (tls_base));
//	printf("buf:%p\t tls_base:0x%x\n", buf, tls_base);

	int aa;
	int offset = 0x10;
	asm volatile ("fs; movl %%ebx, (%1)\n"::"b"(tmp), "r"(offset));

	asm volatile ("movl %%fs:0x10, %%edx\n":"=d"(aa));

//	printf("buf:%s\n", buf);
	printf("aa:0x%x\n", aa);
	return 0;
}
