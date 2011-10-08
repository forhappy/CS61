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
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <math.h>
#include <stdbool.h>
#include "mm.h"
#include "memlib.h"

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

#define ALIGNMENT 8 //字节对齐
#define HEADER_SIZE 8//首部长度
#define FOOTER_SIZE 8//尾部长度
#define MIN_SIZE 24 // 首部 + 尾部 + 最小块的大小 (8)==24
#define NUM_FREE_LISTS 28
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~(ALIGNMENT-1))
#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

/*为了简化回收归并操作，在堆分配的空闲链表表首和表尾均设置一个空的块*/
#define MAKE_BOUNDARY(block) (WRITE(CMPT_HEADPTR(block),COMPRESS(0,1,1)))

#define TAG_SIZE 4//首尾标记4个字节
#define COMPRESS(size, alloc, prev_alloc) ((size | alloc) | (prev_alloc << 1))

/* 从地址 p 所示的内存单元读取一个数据 */
#define READ(p) (*(unsigned int *)(p))

/* 从地址 p 所示的内存单元写入一个数据 */
#define WRITE(p, val)  (*(unsigned int *)(p) = (val))

/* 如果给定指向某一内存块的指针，则计算其头部字段的地址*/
#define CMPT_HEADPTR(bp)       ((void*)(bp) - HEADER_SIZE)

/* 如果给定指向某一内存块的指针，则计算其尾部字段的地址*/
#define CMPT_FOOTPTR(bp)  ((void*)(bp) + GET_BLKSIZE(CMPT_HEADPTR(bp)))

/* 从地址 P 指定的内存单元读取size字段，以获取当前内存块的大小*/
#define GET_BLKSIZE(p)  (READ(p) & ~(ALIGNMENT-1))

/*获得一个内存块的大小；*/
#define GET_PAYLOAD_SIZE(bp)  (GET_BLKSIZE(CMPT_HEADPTR(bp)))
/*获得填充后的块大小；*/
#define GET_PAD_SIZE(size) (size + HEADER_SIZE + FOOTER_SIZE)
/*一个内存块填充后的大小；*/
#define GET_ACTUAL_BLOCK_SIZE(bp) (GET_PAD_SIZE(GET_PAYLOAD_SIZE(bp)))

/*1 被占用, 0 空闲；*/
#define IS_ALLOCATED(bp)    (READ(CMPT_HEADPTR(bp)) & 0x1)
#define IS_FREE(bp)     (!IS_ALLOCATED(bp))

/*前一个块是否被占用*/
#define IS_PREV_ALLOCATED(bp) ((READ(CMPT_HEADPTR(bp)) & 0x2) == 0x2)
/*后一个块是否被占用*/
#define IS_NEXT_ALLOCATED(bp) (IS_ALLOCATED(GO_NEXT_BLOCK(bp)))

/*设置某一块被占用*/
#define SET_BLK_ALLOCATED(bp)  (WRITE(CMPT_HEADPTR(bp),READ(CMPT_HEADPTR(bp)) | 0x1))
/*设置某一块空闲*/
#define SET_BLK_FREE(bp)   (WRITE(CMPT_HEADPTR(bp),READ(CMPT_HEADPTR(bp)) & ~0x1))
/*设置前一块被占用*/
#define SET_PREV_ALLOCATED(bp) (WRITE(CMPT_HEADPTR(bp), READ(CMPT_HEADPTR(bp)) | 0x2))
/*设置前一块空闲*/
#define SET_PREV_FREE(bp)  (WRITE(CMPT_HEADPTR(bp), READ(CMPT_HEADPTR(bp)) & ~0x2))

#define GO_NEXT_BLOCK(bp) (bp + GET_ACTUAL_BLOCK_SIZE(bp))
#define GO_PREV_BLOCK(bp) (bp - GET_PAD_SIZE(GET_BLKSIZE((CMPT_HEADPTR(bp) - FOOTER_SIZE))))

#define GET_FREE_LIST(type) ((void**) (ptr_to_heap_list + (ilog2(type) - 3) * 4))

#define NEXT_FREE_BLOCK(bp) ((void**) ((void*) CMPT_HEADPTR(bp) + TAG_SIZE))
#define PREV_FREE_BLOCK(bp) ((void**) ((void*) CMPT_FOOTPTR(bp) + TAG_SIZE))
#define GET_NEXT_FREE_BLOCK(bp) (*NEXT_FREE_BLOCK(bp))
#define GET_PREV_FREE_BLOCK(bp) (*PREV_FREE_BLOCK(bp))
#define SET_NEXT_FREE_BLOCK(bp,next) (GET_NEXT_FREE_BLOCK(bp) = next)
#define SET_PREV_FREE_BLOCK(bp,prev) (GET_PREV_FREE_BLOCK(bp) = prev)


void* ptr_to_heap_list;//堆的首指针；
void* ptr_to_first_blk;//第一个块的指针；
void* ptr_to_last_blk;//最后一个块的指针；
//查找空闲块；
static void* find_free_block(int request_size);
static unsigned int get_type(size_t size);
//分配新的块；
static void* alloc_nwblk(size_t size);
static void update_size(void* block, size_t new_size);
static void* split_block(void* block, size_t carve_size);
static void delete_blk_from_free_list(void* block);
static void push_free_list(void* block);
static void* combine(void* block);


static int ilog2(unsigned int x) {
	register unsigned int l = 0;
	if (x >= 1 << 16) {
		x >>= 16;
		l |= 16;
	}
	if (x >= 1 << 8) {
		x >>= 8;
		l |= 8;
	}
	if (x >= 1 << 4) {
		x >>= 4;
		l |= 4;
	}
	if (x >= 1 << 2) {
		x >>= 2;
		l |= 2;
	}
	if (x >= 1 << 1)
		l |= 1;
	return l;
}

/*
 static int ilog2(unsigned int n) {
 int pos = 0;
 while(n>1)
 {
 pos++;
 n>>=1;
 }
 return  pos;
 }
 */

/*
 * mm_init - 初始化内存堆，使指针指向空闲链表的适当位置，并初始化第一个和最后一个块
 */
int mm_init(void) {
	// 为空闲表开辟空间
	ptr_to_heap_list = mem_sbrk(NUM_FREE_LISTS * sizeof(void**) + 2
			*GET_PAD_SIZE(0));
	void** current_index = ptr_to_heap_list;

	// 初始化所有的列表指针，让其指向链表尾部；
	int i;
	for (i = 0; i < NUM_FREE_LISTS; i++) {
		*current_index = (void *) 0;
		current_index++;
	}

	ptr_to_first_blk = (void*) current_index + HEADER_SIZE; // We point to payload so our macros work
	MAKE_BOUNDARY(ptr_to_first_blk);
	ptr_to_last_blk = ptr_to_first_blk + GET_PAD_SIZE(0);
	MAKE_BOUNDARY(ptr_to_last_blk);
	return 0;
}

/*
 * mm_malloc --分配一个大小由参数size所指定的内存块；
 */
void *mm_malloc(size_t size) {
	int newsize = ALIGN(size);

	// 在空闲表中找到一个大小为newsize的块；
	void *p = find_free_block(newsize);
	if (p == (void *) -1)//如果上述操作失败，则分配新的空间；
		p = alloc_nwblk(newsize);

	if (p == NULL)
		return p;

	delete_blk_from_free_list(p);
	SET_BLK_ALLOCATED(p);
	SET_PREV_ALLOCATED(GO_NEXT_BLOCK(p));
	return p;
}

/*
 * mm_free
 */
void mm_free(void *ptr) {
	SET_BLK_FREE(ptr);
	SET_PREV_FREE(GO_NEXT_BLOCK(ptr));
	push_free_list(ptr);
	combine(ptr);
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
 * 查找第一个可用的空闲块，块的大小是应大于REQUEST_SIZE。
 */
static void* find_free_block(int request_size) {

	unsigned int type = get_type(request_size);
	void** list;
	for (list = GET_FREE_LIST(type); (void*) list < CMPT_HEADPTR(ptr_to_first_blk); list++) {
		// 空闲链表的头部；
		void* current_block = *list;
		/* 遍历空闲链表查找合适的块，如果找到，则分割并返回 */
		while (current_block != (void *) 0) {
			if (GET_PAYLOAD_SIZE(current_block) >= request_size)
				return split_block(current_block, request_size);
			current_block = GET_NEXT_FREE_BLOCK(current_block);
		}
	}
	return (void *) -1;
}

static unsigned int get_type(size_t size) {
	int type = 16;
	while (type <= size)
		type <<= 1;
	return type >>= 1;
}

static void* alloc_nwblk(size_t size) {
	size_t block_size = GET_PAD_SIZE(size);
	size_t size_needed = block_size - (IS_PREV_ALLOCATED(ptr_to_last_blk) ? 0 : GET_ACTUAL_BLOCK_SIZE(GO_PREV_BLOCK(ptr_to_last_blk)));
	void* p = mem_sbrk(size_needed);
	p = ptr_to_last_blk;
	SET_BLK_FREE(p);
	update_size(p, size_needed - 16);
	push_free_list(p);
	ptr_to_last_blk += size_needed;
	MAKE_BOUNDARY(ptr_to_last_blk);
	SET_PREV_FREE(ptr_to_last_blk);
	p = combine(p);
	return split_block(p, size);
}

static void update_size(void* block, size_t new_size) {
	int new_tag =
			COMPRESS(new_size,IS_ALLOCATED(block),IS_PREV_ALLOCATED(block));
	WRITE(CMPT_HEADPTR(block),new_tag);
	WRITE(CMPT_FOOTPTR(block),new_tag);
}

static void* split_block(void* block, size_t carve_size) {
	size_t initial_size = GET_PAYLOAD_SIZE(block);
	// 是否需要分割；
	if (initial_size >= carve_size + MIN_SIZE) {
		delete_blk_from_free_list(block);

		// 更新块的大小；
		update_size(block, carve_size);

		// 创建一个新的块并设置其大小；
		void* new_block = GO_NEXT_BLOCK(block);
		size_t new_size = initial_size - GET_ACTUAL_BLOCK_SIZE(block);
		update_size(new_block, new_size);
		SET_BLK_FREE(new_block);
		SET_PREV_FREE(GO_NEXT_BLOCK(new_block));
		push_free_list(new_block);
		// 将块添加到合适的空闲链表；
		push_free_list(block);

	}

	return block;
}

/*
 * 从空闲链表区删除一个块
 */
static void delete_blk_from_free_list(void* block) {
	void* prev = GET_PREV_FREE_BLOCK(block);
	void* next = GET_NEXT_FREE_BLOCK(block);
	// 如果删除了头部，则更新相应的空闲链表的指针；
	if (prev == (void *) 0)
		*GET_FREE_LIST(get_type(GET_PAYLOAD_SIZE(block))) = next;
	else
		SET_NEXT_FREE_BLOCK(prev,next);
	// 删除尾部
	if (next != (void *) 0)
		SET_PREV_FREE_BLOCK(next,prev);
}

/*
 * combine - 边界标志算法的合并. 返回指向合并后的内存块指针
 */
static void* combine(void* block) {
	bool prev_alloc = IS_PREV_ALLOCATED(block);
	bool next_alloc = IS_NEXT_ALLOCATED(block);
	size_t size = GET_PAYLOAD_SIZE(block);

	// 情形一：前后块均被占用；
	if (prev_alloc && next_alloc) {
		return block;
	}

	// 情形二：下一个块空闲；
	else if (prev_alloc) {
		void* next = GO_NEXT_BLOCK(block);

		delete_blk_from_free_list(block);
		delete_blk_from_free_list(next);
		// 相关的更新操作；
		size += GET_PAD_SIZE(GET_PAYLOAD_SIZE(next));
		WRITE(CMPT_HEADPTR(block), COMPRESS(size,0,IS_PREV_ALLOCATED(block)));
		WRITE(CMPT_FOOTPTR(next), COMPRESS(size,0,IS_PREV_ALLOCATED(block)));

		push_free_list(block);
		return block;
	}

	// 情形三：前一个块空闲；
	else if (next_alloc) {
		void* prev = GO_PREV_BLOCK(block);
		delete_blk_from_free_list(block);
		delete_blk_from_free_list(prev);
		size += GET_PAD_SIZE(GET_PAYLOAD_SIZE(prev));
		WRITE(CMPT_FOOTPTR(block), COMPRESS(size,0,IS_PREV_ALLOCATED(prev)));
		WRITE(CMPT_HEADPTR(prev), COMPRESS(size,0,IS_PREV_ALLOCATED(prev)));
		push_free_list(prev);
		return prev;
	}
	// 合并；
	else {//前后块均空闲；
		void* prev = GO_PREV_BLOCK(block);
		void* next = GO_NEXT_BLOCK(block);
		// 维护空闲列表；
		delete_blk_from_free_list(block);
		delete_blk_from_free_list(prev);
		delete_blk_from_free_list(next);
		size += GET_PAD_SIZE(GET_PAYLOAD_SIZE(prev))
				+ GET_PAD_SIZE(GET_PAYLOAD_SIZE(next));
		WRITE(CMPT_HEADPTR(prev), COMPRESS(size,0,IS_PREV_ALLOCATED(prev)));
		WRITE(CMPT_FOOTPTR(next), COMPRESS(size,0,IS_PREV_ALLOCATED(prev)));
		push_free_list(prev);
		return prev;
	}
}
/*
 * 找到一个块，将它放入适当的空闲链表的合适位置；
 */
static void push_free_list(void* block) {
	unsigned int type = get_type(GET_PAYLOAD_SIZE(block));
	void* head = *GET_FREE_LIST(type);
	SET_NEXT_FREE_BLOCK(block,head);
	if (head != (void *) 0)
		SET_PREV_FREE_BLOCK(head,block);
	SET_PREV_FREE_BLOCK(block, (void *) 0);
	*GET_FREE_LIST(type) = block;
}

