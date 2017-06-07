libJniSample.o: JniSample.c
	cc -v -c -fPIC JniSample.c -o libJniSample.o

libJniSample.dylib: libJniSample.o
	libtool -dynamic -lSystem libJniSample.o -o libJniSample.dylib

