#! /bin/bash -ex

PREFIX="$1/i686-w64-mingw32"

rm -Rf "$PREFIX/lib/c-zlib"
mkdir -p "$PREFIX/lib/c-zlib"

make -f win32/Makefile.gcc PREFIX=i686-w64-mingw32-
make -f win32/Makefile.gcc PREFIX=i686-w64-mingw32- install \
  INCLUDE_PATH="$PREFIX/include" BINARY_PATH="$PREFIX/bin"  \
  LIBRARY_PATH="$PREFIX/lib/c-zlib" SHARED_MODE=1
