#! /bin/bash -ex

PREFIX="$1"

make -C tools/extract_args

export PATH="$PREFIX/i686-w64-mingw32/bin:$PATH"

./configure -sitelib "$PREFIX/i686-w64-mingw32/lib" -system unix

make install-meta

mkdir -p "$PREFIX/lib/findlib.conf.d"
cp win32.conf "$PREFIX/lib/findlib.conf.d/"

chmod +x ocamlfind
cp ocamlfind "$PREFIX/i686-w64-mingw32/bin/ocamlfind"
ln -sf "$PREFIX/i686-w64-mingw32/bin/ocamlfind" \
       "$PREFIX/bin/i686-w64-mingw32-ocamlfind"
