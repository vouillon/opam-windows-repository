#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/c-leveldb"

rm -Rf "${LIB}"
