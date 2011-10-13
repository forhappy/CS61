/*
 * =====================================================================================
 *
 *       Filename:  swap.c
 *
 *    Description:  swap two intergers.
 *
 *        Version:  1.0
 *        Created:  10/13/2011 10:22:55 AM
 *       Revision:  r1
 *       Compiler:  gcc
 *
 *         Author:  Fu Haiping 
 *        Company:  ICT
 *
 * =====================================================================================
 */
void swap(int *xp, int *yp)
{
	int t0 = *xp;
	int t1 = *yp;
	*xp = t0;
	*yp = t1;
}
