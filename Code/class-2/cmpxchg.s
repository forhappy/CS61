.section .data
data:
	.int 10

.section .text
.globl _start

_start:
	nop
	movl $10, %eax
	movl $5,  %edx
	cmpxchg %eax, %edx
	movl $1, %eax
	int $0x80
