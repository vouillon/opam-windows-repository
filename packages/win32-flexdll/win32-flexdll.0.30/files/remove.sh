#! /bin/bash -ex

PREFIX="$1"
BIN="$2"
LIB="${PREFIX}/lib/flexdll"

if [ -f "${LIB}/flexdll_mingw64.o" ]; then
    rm -f "${LIB}/flexdll_mingw.o"
    rm -f "${LIB}/flexdll_initer_mingw.o"
else
    rm -f "${BIN}/flexlink"
    rm -Rf "${LIB}"
fi
