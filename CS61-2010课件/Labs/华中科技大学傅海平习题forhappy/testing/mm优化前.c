/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 *
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "mm.h"
#include "memlib.h"

/*
 * 定义两种内存分配算法，首次分配算法和循环首次分配算法；
 * 如果定义了NEXT_FIT,则采用循环首次适应算法，将下面的注释去掉即采用首次适应算法；
 */
//#define NEXT_FIT


/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8
/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~(ALIGNMENT-1))
#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

#define WORD       4       /* 内存字的大小，也代表一个内存块节点头部和尾部标识字段长度（4个字节）*/
#define DWORD       8       /* 双字大小（8个字节）*/
#define INCREMENTSIZE  (1<<12)  /* 每次将堆扩大INCREMENTSIZE所标示的字节数*/

#define MAX(x, y) ((x) > (y)? (x) : (y))

/* 将size和allocated字段压缩成一个字*/
#define COMPRESS(size, alloc)  ((size) | (alloc))

/* 从地址 p 所示的内存单元读取一个数据 */
#define READ(p) (*(unsigned int *)(p))

/* 从地址 p 所示的内存单元写入一个数据 */
#define WRITE(p, val)  (*(unsigned int *)(p) = (val))

/* 从地址 P 指定的内存单元读取size字段，以获取当前内存块的大小*/
#define GET_BLKSIZE(p)  (READ(p) & ~(ALIGNMENT-1))

/* 从地址 P 指定的内存单元读取allocated字段，以判断内存块是否被占用*/
#define IS_ALLOCATED(p) (READ(p) & 0x1)

/* 如果给定指向某一内存块的指针，则计算其头部字段的地址*/
#define CMPT_HEADPTR(bp)       ((char *)(bp) - WORD)

/* 如果给定指向某一内存块的指针，则计算其尾部字段的地址*/
#define CMPT_FOOTPTR(bp)       ((char *)(bp) + GET_BLKSIZE(CMPT_HEADPTR(bp)) - DWORD)

/* 如果给定指向内存块的指针，则计算下一个内存块的地址*/
#define GET_NEXT_BLKPTR(bp)  ((char *)(bp) + GET_BLKSIZE(((char *)(bp) - WORD)))

/* 如果给定指向内存块的指针，则计算前一个内存块的地址*/
#define GET_PREV_BLKPTR(bp)  ((char *)(bp) - GET_BLKSIZE(((char *)(bp) - DWORD)))

/* 全局变量 */
static char *g_pHeadList = 0; /* 指向第一个内存块的指针 */


#ifdef NEXT_FIT
static char *g_pNextFit; /* 循环首次适应算法的指针 g_pNextFit */
#endif

team_t team = {
/* Team name */
"forhappy",
/* First member's full name */
"haipingf",
/* First member's email address */
"haipingf@gmail.com&&258347328@qq.com",
/* Second member's full name (leave blank if none) */
"",
/* Second member's email address (leave blank if none) */
"" }; /* The global condition sign */

/* 自定义函数 */
static void *extend_heap(size_t words);
static void split_blk(void *bp, size_t adjustedsize);
static void *find_fit(size_t adjustedsize);
static void *combine(void *bp);

/*
 * mm_init - 初始化内存块；
 */
int mm_init(void) {
	/* 创建初始的空堆； */
	if ((g_pHeadList = mem_sbrk(4 * WORD)) == (void *) -1)
		//最小的堆，大小为4*WORD=16字节，返回堆的首址；
		return -1;//如创建失败，则返回-1；
	WRITE(g_pHeadList, 0); /* 字段对准填充 */
	WRITE(g_pHeadList + (1*WORD), COMPRESS(DWORD, 1)); /* 第一个内存块的首部字段*/
	WRITE(g_pHeadList + (2*WORD), COMPRESS(DWORD, 1)); /* 第一个内存块的尾部字段*/
	WRITE(g_pHeadList + (3*WORD), COMPRESS(0, 1)); /* 最后一个内存块的首部字段*/
	g_pHeadList += (2 * WORD);

#ifdef NEXT_FIT
	g_pNextFit = g_pHeadList;
#endif

	/* 将空堆扩大至INCREMENTSIZE字节大小 */
	if (extend_heap(INCREMENTSIZE / WORD) == NULL)
		return -1;
	return 0;
}

/* 
 * mm_malloc - 分配一个大小由参数size所指定的内存块；
 */

void *mm_malloc(size_t size) {
	size_t adjustedsize;
	size_t extendsize; /* 如果存储空间不够，则开辟大小由extendsize所指示的新堆*/
	char *bp;

	if (g_pHeadList == 0) {
		mm_init();
	}

	/* 忽略用户请求不合法的数值*/
	if (size == 0)
		return NULL;

	/* 调整块的大小，包括首尾字段开销和字节对齐开销*/
	if (size <= DWORD)
		adjustedsize = 2 * DWORD;
	else
		adjustedsize = DWORD * ((size + (DWORD) + (DWORD - 1)) / DWORD);

	/* 搜索空闲链表以查找合适的位置*/
	if ((bp = find_fit(adjustedsize)) != NULL) {
		split_blk(bp, adjustedsize);
		return bp;
	}

	/* 如果没有找到，则开辟新的堆来存放将要分配的块*/
	extendsize = MAX(adjustedsize,INCREMENTSIZE);
	if ((bp = extend_heap(extendsize / WORD)) == NULL)
		return NULL;
	split_blk(bp, adjustedsize);
	return bp;
}

/*
 * mm_free - 释放内存块
 */
void mm_free(void *bp) {

	if (bp == 0)
		return;

	size_t size = GET_BLKSIZE(CMPT_HEADPTR(bp));//找到头部位置；

	if (g_pHeadList == 0) {
		mm_init();//如果堆本身为空，则该函数相当于mm_init();
	}
	WRITE(CMPT_HEADPTR(bp), COMPRESS(size, 0));
	WRITE(CMPT_FOOTPTR(bp), COMPRESS(size, 0));
	combine(bp);
}

/*
 * combine - 边界标志算法的合并. 返回指向合并后的内存块指针
 */

static void *combine(void *bp) {
	size_t prev_alloc = IS_ALLOCATED(CMPT_FOOTPTR(GET_PREV_BLKPTR(bp)));//找到由bp所给定的内存块的前一内存块的尾部中的allocated字段；
	size_t next_alloc = IS_ALLOCATED(CMPT_HEADPTR(GET_NEXT_BLKPTR(bp)));//找到由bp所给定的内存块的后一内存块的首部中的allocated字段；
	size_t size = GET_BLKSIZE(CMPT_HEADPTR(bp));//获得bp所指定块的大小；

	if (prev_alloc && next_alloc) { /* 情形一：左右内存块都被占用，则直接返回，不用任何操作 */
		return bp;
	}

	else if (prev_alloc && !next_alloc) { /* 情形二：左边内存块被占用，而右边的内存块空闲，则把将要被释放的块与右边的块合并 */
		size += GET_BLKSIZE(CMPT_HEADPTR(GET_NEXT_BLKPTR(bp)));
		WRITE(CMPT_HEADPTR(bp), COMPRESS(size, 0));//更新首部中的size和callocated字段；
		WRITE(CMPT_FOOTPTR(bp), COMPRESS(size,0));//更新尾部中的size和callocated字段；
	}

	else if (!prev_alloc && next_alloc) { /* 情形三：右边内存块被占用，而左边的内存块空闲，则把将要被释放的块与右边的块合并 */
		size += GET_BLKSIZE(CMPT_HEADPTR(GET_PREV_BLKPTR(bp)));//size被更新；
		WRITE(CMPT_FOOTPTR(bp), COMPRESS(size, 0));//更新尾部中的size和callocated字段；
		WRITE(CMPT_HEADPTR(GET_PREV_BLKPTR(bp)), COMPRESS(size, 0));//更新首部中的size和callocated字段；
		bp = GET_PREV_BLKPTR(bp);//bp指向左部内存块；
	}

	else { /*情形四：左右内存块均为空闲，则把将要被释放的块与左右内存块合并 */
		size += GET_BLKSIZE(CMPT_HEADPTR(GET_PREV_BLKPTR(bp))) + GET_BLKSIZE(CMPT_FOOTPTR(GET_NEXT_BLKPTR(bp)));
		WRITE(CMPT_HEADPTR(GET_PREV_BLKPTR(bp)), COMPRESS(size, 0));//更新首部中的size和callocated字段；
		WRITE(CMPT_FOOTPTR(GET_NEXT_BLKPTR(bp)), COMPRESS(size, 0));//更新尾部中的size和callocated字段；
		bp = GET_PREV_BLKPTR(bp);//bp指向左部内存块；
	}

#ifdef NEXT_FIT
	/* 确保rover没有指向刚刚合并的空闲块*/
	if ((g_pNextFit > (char *)bp) && (g_pNextFit < GET_NEXT_BLKPTR(bp)))
	g_pNextFit = bp;
#endif
	return bp;//成功返回；
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size) {
	void *oldptr = ptr;
	void *newptr;
	size_t copySize;

	newptr = mm_malloc(size);
	if (newptr == NULL)
		return NULL;
	copySize = *(size_t *) ((char *) oldptr - SIZE_T_SIZE);
	if (size < copySize)
		copySize = size;
	memcpy(newptr, oldptr, copySize);
	mm_free(oldptr);
	return newptr;
}

/*
 * checkheap - We don't check anything right now.
 */
void mm_checkheap(int verbose) {
}

/*
 * extend_heap - 扩大堆的空间；
 */

static void *extend_heap(size_t words) {
	char *bp;
	size_t size;

	/* 为了保持字节对齐，应分配偶数倍的字大小 */
	size = (words % 2) ? (words + 1) * WORD : words * WORD;
	if ((long) (bp = mem_sbrk(size)) == -1)
		return NULL;

	/* 初始化该空闲块的首部/尾部以及最后一个块的首部*/
	WRITE(CMPT_HEADPTR(bp), COMPRESS(size, 0)); /* //设置空闲块首部的size（置为0，表示空闲）和allocated的字段； */
	WRITE(CMPT_FOOTPTR(bp), COMPRESS(size, 0)); //设置空闲块尾部的size（置为0，表示空闲）和allocated的字段；
	WRITE(CMPT_HEADPTR(GET_NEXT_BLKPTR(bp)), COMPRESS(0, 1)); /* 新的最后一个块的首部 */

	/* 如果前一个块为空闲的，则合并两个空闲块*/
	return combine(bp);
}

/*
 * split_blk -  分配一个空闲块
 */
static void split_blk(void *bp, size_t adjustedsize) {
	size_t csize = GET_BLKSIZE(CMPT_HEADPTR(bp));//获取bp块的大小；

	if ((csize - adjustedsize) >= (2 * DWORD)) {//如果块足够大；
		WRITE(CMPT_HEADPTR(bp), COMPRESS(adjustedsize, 1));//更新bp块首部的size（置为1，表示被占用）和allocated的字段；
		WRITE(CMPT_FOOTPTR(bp), COMPRESS(adjustedsize, 1));//更新bp块尾部的size（置为1，表示被占用）和allocated的字段；
		bp = GET_NEXT_BLKPTR(bp);//分配当前的块
		WRITE(CMPT_HEADPTR(bp), COMPRESS(csize-adjustedsize, 0));//更新剩余块首部的size（置为0，表示空闲）和allocated的字段；
		WRITE(CMPT_FOOTPTR(bp), COMPRESS(csize-adjustedsize, 0));//更新剩余块尾部的size（置为0，表示空闲）和allocated的字段；
	} else {//否则，将整个块分配出去；
		WRITE(CMPT_HEADPTR(bp), COMPRESS(csize, 1));//将首部的allocated字段置为1，表示被占用；
		WRITE(CMPT_FOOTPTR(bp), COMPRESS(csize, 1));//将尾部的allocated字段置为1，表示被占用；
	}
}

/*
 * find_fit - 查找具有adjustedsize字节的内存块
 */

static void *find_fit(size_t adjustedsize)

{

#ifdef NEXT_FIT
	/* 循环首次适应算法 */
	char *oldrover = g_pNextFit;

	/* 从g_pNextFit所示的地方一直搜索的链表的最末尾*/
	for (; GET_BLKSIZE(CMPT_HEADPTR(g_pNextFit)) > 0; g_pNextFit = GET_NEXT_BLKPTR(g_pNextFit))
	if (!IS_ALLOCATED(CMPT_HEADPTR(g_pNextFit)) && (adjustedsize <= GET_BLKSIZE(CMPT_HEADPTR(g_pNextFit))))
	return g_pNextFit;

	/* 从链表头开始搜索一直到g_pNextFit */
	for (g_pNextFit = g_pHeadList; g_pNextFit < oldrover; g_pNextFit = GET_NEXT_BLKPTR(g_pNextFit))
	if (!IS_ALLOCATED(CMPT_HEADPTR(g_pNextFit)) && (adjustedsize <= GET_BLKSIZE(CMPT_HEADPTR(g_pNextFit))))
	return g_pNextFit;

	return NULL; /* 没有找到 */
#else
	/* 首次适应算法 */
	void *bp;

	for (bp = g_pHeadList; GET_BLKSIZE(CMPT_HEADPTR(bp)) > 0; bp = GET_NEXT_BLKPTR(bp)) {
		if (!IS_ALLOCATED(CMPT_HEADPTR(bp)) && (adjustedsize <= GET_BLKSIZE(CMPT_HEADPTR(bp)))) {
			return bp;
		}
	}
	return NULL; /*没有找到 */
#endif
}

