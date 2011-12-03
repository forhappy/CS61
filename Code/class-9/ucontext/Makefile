all:test_uthread

CXX_FLAGS=-Wall -g -std=gnu99

test_uthread:thread.o uthread.o test_uthread.o
	g++ -o $@ $^ -lpthread
thread.o:thread.cpp
	g++ ${CXX_FLAGS} -o $@ -c $^

uthread.o:uthread.cpp
	g++ ${CXX_FLAGS} -o $@ -c $^

test_uthread.o:test_uthread.cpp
	g++ ${CXX_FLAGS} -o $@ -c $^


.PHONY:clean

clean:
	rm *.o test_uthread
