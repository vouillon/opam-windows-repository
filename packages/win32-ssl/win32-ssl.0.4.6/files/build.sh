#! /bin/bash -ex

PREFIX="$1"

CPPFLAGS="-DWIN32=1 -I$PREFIX/i686-w64-mingw32/include"
LDFLAGS="-L$PREFIX/i686-w64-mingw32/lib/c-openssl"
PATH="$PREFIX/i686-w64-mingw32/bin:$PATH"

export CPPFLAGS LDFLAGS PATH

./configure --host i686-w64-mingw32 OCAMLFIND="$PREFIX/bin/ocamlfind -toolchain win32"
make
make install
