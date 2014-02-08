#!/bin/sh -e

EXEC_PREFIX=x86_64-w64-mingw32
PREFIX=$1/$EXEC_PREFIX

export CROSS_COMPILE=${EXEC_PREFIX}-

./Configure mingw64 shared --prefix=$PREFIX zlib --with-zlib-include=$PREFIX/include --with-zlib-lib=$PREFIX/lib

make
make install
