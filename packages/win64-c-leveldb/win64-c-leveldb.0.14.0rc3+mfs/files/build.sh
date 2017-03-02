#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/c-leveldb"

cd src/leveldb
patch -p1 < ../../add-max-file-size.patch
cd ../..

TARGET_OS=NATIVE_WINDOWS   \
CC=x86_64-w64-mingw32-gcc  \
CXX=x86_64-w64-mingw32-g++ \
AR=x86_64-w64-mingw32-ar   \
make -C src/leveldb out-static/libleveldb.a out-static/libmemenv.a out-shared/libleveldb.so

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/leveldb/out-static/libleveldb.a  "${LIB}/"
cp src/leveldb/out-shared/libleveldb.so "${LIB}/"
cp -a src/leveldb/include/leveldb       "${LIB}/"
