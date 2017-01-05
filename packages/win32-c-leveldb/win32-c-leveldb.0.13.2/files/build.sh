#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/c-leveldb"

TARGET_OS=NATIVE_WINDOWS   \
CC=i686-w64-mingw32-gcc  \
CXX=i686-w64-mingw32-g++ \
AR=i686-w64-mingw32-ar   \
make -C src/leveldb libleveldb.a libmemenv.a libleveldb.so

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/leveldb/libleveldb.a       "${LIB}/"
cp src/leveldb/libleveldb.so      "${LIB}/"
cp -a src/leveldb/include/leveldb "${LIB}/"
