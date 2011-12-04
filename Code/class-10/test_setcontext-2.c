/*
 * =====================================================================================
 *
 *       Filename:  test_setcontext-2.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  05/14/2011 09:59:07 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *        Company:  
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <ucontext.h>
 
int main(int argc, const char *argv[]){
        ucontext_t context;
 
        getcontext(&context);
        puts("Hello world");
        sleep(1);
        setcontext(&context);
        return 0;
}
