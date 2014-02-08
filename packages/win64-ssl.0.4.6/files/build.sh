#!/bin/sh -e

PREFIX=$1

CPPFLAGS="-DWIN32=1 -I$PREFIX/x86_64-w64-mingw32/include"
LDFLAGS=-L$PREFIX/x86_64-w64-mingw32/lib
PATH="$PREFIX/x86_64-w64-mingw32/bin:$PATH"

export CPPFLAGS LDFLAGS PATH

./configure --host x86_64-w64-mingw32 OCAMLFIND="$PREFIX/bin/ocamlfind -toolchain win64"
make
make install
