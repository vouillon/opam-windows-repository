#!/bin/sh -e

PREFIX=$1

make -C tools/extract_args

export PATH=$PREFIX/x86_64-w64-mingw32/bin:$PATH

./configure -sitelib "$PREFIX/x86_64-w64-mingw32/lib" -system unix

make install-meta

mkdir -p "$PREFIX/lib/findlib.conf.d"
cp win64.conf "$PREFIX/lib/findlib.conf.d/"

chmod +x ocamlfind
cp ocamlfind "$PREFIX/x86_64-w64-mingw32/bin/ocamlfind"
ln -sf "$PREFIX/x86_64-w64-mingw32/bin/ocamlfind" \
     "$PREFIX/bin/x86_64-w64-mingw32-ocamlfind"
