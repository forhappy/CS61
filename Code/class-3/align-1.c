/*
 * =====================================================================================
 *
 *       Filename:  align-1.c
 *
 *    Description:  alignment test for linux
 *
 *        Version:  1.0
 *        Created:  10/21/2011 08:16:43 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Fu Haiping
 *        Company:  ICT
 *
 * =====================================================================================
 */
#include <stdio.h>
struct S {
	char c;
	int i[2];
	double v;
}__attribute__((aligned (1)));
struct S s __attribute__((aligned(1)));

int main(int argc, const char *argv[])
{
	printf("sizeof struct S:%d\n", sizeof(s));
	return 0;
}
