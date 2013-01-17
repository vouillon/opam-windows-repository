#!/bin/sh -e

EXEC_PREFIX=i686-w64-mingw32
PREFIX=$1/$EXEC_PREFIX

export CROSS_COMPILE=${EXEC_PREFIX}-

./Configure mingw shared --prefix=$PREFIX zlib --with-zlib-include=$PREFIX/include --with-zlib-lib=$PREFIX/lib

make
make install
