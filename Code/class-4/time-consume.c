/*
 * =====================================================================================
 *
 *       Filename:  time-consume.c
 *
 *    Description:  a time-comsuming application.
 *
 *        Version:  1.0
 *        Created:  10/25/2011 10:07:20 AM
 *       Revision:  r1
 *       Compiler:  gcc
 *
 *         Author:  Fu Haiping
 *        Company:  ICT
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int a(void) 
{
    int i=0,g=0;
    while(i++<100000)
    {
        g+=i;
    }
    return g;
}

int b(void) 
{
    int i=0,g=0;
    while(i++<400000)
    {
        g+=i;
    }
    return g;
}
int main(int argc, char** argv)
{
    int iterations;
    if(argc != 2)
    {
        printf("Usage %s <No of Iterations>\n", argv[0]);
        exit(-1);
    }
    else
        iterations = atoi(argv[1]);
    printf("No of iterations = %d\n", iterations);
    while(iterations--)
    {
        a();
        b();
    }
}
