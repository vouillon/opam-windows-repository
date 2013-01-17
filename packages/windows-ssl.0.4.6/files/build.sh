#!/bin/sh -e

PREFIX=$1

CPPFLAGS="-DWIN32=1 -I$PREFIX/i686-w64-mingw32/include"
LDFLAGS=-L$PREFIX/i686-w64-mingw32/lib
PATH="$PREFIX/bin/i686-w64-mingw32:$PATH"

export CPPFLAGS LDFLAGS PATH

./configure --host i686-w64-mingw32 OCAMLFIND="$PREFIX/bin/ocamlfind -toolchain windows"
make
make install
