#!/bin/sh -e

PREFIX=$1

make -C tools/extract_args

export PATH=$PREFIX/bin/i686-w64-mingw32:$PATH

./configure -sitelib "$PREFIX/i686-w64-mingw32/lib" -system unix

make install-meta

mkdir -p "$PREFIX/lib/findlib.conf.d"
cp windows.conf "$PREFIX/lib/findlib.conf.d/"

chmod +x ocamlfind
cp ocamlfind "$PREFIX/bin/i686-w64-mingw32/ocamlfind"
ln -sf "$PREFIX/bin/i686-w64-mingw32/ocamlfind" \
     "$PREFIX/bin/i686-w64-mingw32-ocamlfind"
