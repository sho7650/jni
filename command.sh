vi JniSample.java
javac JniSample.java
/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/bin/javah JniSample
vi JniSample.h 
vi JniSample.c
cc -v -c -fPIC -I/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/include/darwin JniSample.c -o libJniSample.o
libtool -dynamic -lSystem libJniSample.o -o libJniSample.dylib
export LD_LIBRARY_PATH=.
java JniSample
