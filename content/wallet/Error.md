/*
Title: Wallet Errors
Description: The edge of sanity.
Sort: 1
*/

#### Error while loading shared libraries: libzmq.so.5?
```
methuselahd: error while loading shared libraries: libzmq.so.5: cannot open shared object file: No such file or directory
```
Try installing `sudo apt-get install libzmq3-dev`.

#### Unable to locate `libboost_system.so.1.58.0`?
```
/usr/local/methuselah/bin/methuselahd: error while loading shared libraries: libboost_system.so.1.58.0: cannot open shared object file: No such file or directory
```
Try installing `sudo apt-get install libboost-all-dev`.

#### Include "build.h" error during build?
```
  CXX      libmethuselah_util_a-clientversion.o
clientversion.cpp:43:10: fatal error: build.h: No such file or directory
 #include "build.h"
          ^~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:6292: libmethuselah_util_a-clientversion.o] Error 1
```
Try building with BOOST 1.58.