/*
 * =====================================================================================
 *
 *       Filename:  echo.c
 *
 *    Description:  echo 
 *
 *        Version:  1.0
 *        Created:  10/21/2011 09:14:08 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Fu Haiping
 *        Company:  ICT
 *
 * =====================================================================================
 */
/* Echo Line */
#include <stdio.h>
void echo()
{
	char buf[4];
	gets(buf);
	puts(buf);
}

int main(int argc, const char *argv[])
{
	echo();
	return 0;
}

