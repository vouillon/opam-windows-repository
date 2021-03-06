#! /bin/bash -ex

PREFIX="$1/x86_64-w64-mingw32"
DOC="${PREFIX}/doc/menhir"
LIB="${PREFIX}/lib/menhir"
MAN="${PREFIX}/man/man1"

make -C src bootstrap PREFIX="${PREFIX}" docdir="${DOC}" libdir="${LIB}" mandir="${MAN}"
make -C src library   PREFIX="${PREFIX}" docdir="${DOC}" libdir="${LIB}" mandir="${MAN}"
make install          PREFIX="${PREFIX}" docdir="${DOC}" libdir="${LIB}" mandir="${MAN}"
