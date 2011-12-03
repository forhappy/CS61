/*
 * =============================================================================
 *
 *       Filename:  setcontext-while-loop.c
 *
 *    Description:  setcontext emulate while loop
 *
 *        Version:  0.0.1
 *        Created:  12/03/2011 10:24:31 PM
 *       Revision:  r1
 *       Compiler:  gcc (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5
 *
 *         Author:  Fu Haiping (forhappy), haipingf@gmail.com
 *        Company:  ICT ( Institute Of Computing Technology, CAS )
 *
 * =============================================================================
 */
#include <stdio.h>
#include <ucontext.h>
#include <unistd.h>
 
int main(int argc, const char *argv[]){
        ucontext_t context;
 
        getcontext(&context);
        puts("Hello world");
        sleep(1);
        setcontext(&context);
        return 0;
}
