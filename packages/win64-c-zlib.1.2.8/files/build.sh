#!/bin/sh -e

PREFIX=$1/x86_64-w64-mingw32

make -f win32/Makefile.gcc PREFIX=x86_64-w64-mingw32-
make -f win32/Makefile.gcc PREFIX=x86_64-w64-mingw32- install INCLUDE_PATH=$PREFIX/include BINARY_PATH=$PREFIX/bin LIBRARY_PATH=$PREFIX/lib SHARED_MODE=1
