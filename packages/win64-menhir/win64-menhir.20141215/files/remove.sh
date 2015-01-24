#! /bin/bash -ex

PREFIX="$1"

x86_64-w64-mingw32-ocamlfind remove menhirLib

rm -f  "${PREFIX}/x86_64-w64-mingw32/bin/menhir"
rm -Rf "${PREFIX}/x86_64-w64-mingw32/doc/menhir"
rm -Rf "${PREFIX}/x86_64-w64-mingw32/lib/menhir"
rm -Rf "${PREFIX}/x86_64-w64-mingw32/man/man1/menhir.1"
