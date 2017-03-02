#! /bin/bash -ex

PREFIX="$1"

i686-w64-mingw32-ocamlfind remove menhirLib

rm -f  "${PREFIX}/i686-w64-mingw32/bin/menhir"
rm -Rf "${PREFIX}/i686-w64-mingw32/doc/menhir"
rm -Rf "${PREFIX}/i686-w64-mingw32/lib/menhir"
rm -Rf "${PREFIX}/i686-w64-mingw32/man/man1/menhir.1"
