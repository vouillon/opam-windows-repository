#! /bin/bash -ex

PREFIX="$1"
BIN="$2"
LIB="${PREFIX}/lib/flexdll"

make build_mingw flexlink.exe

mkdir -p "${LIB}"

cp flexlink.exe           "${LIB}/"
cp flexdll.h              "${LIB}/"
cp flexdll_mingw.o        "${LIB}/"
cp flexdll_initer_mingw.o "${LIB}/"

ln -sf "${LIB}/flexlink.exe" "${BIN}/flexlink"
