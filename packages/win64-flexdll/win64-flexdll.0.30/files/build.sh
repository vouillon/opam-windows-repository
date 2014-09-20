#! /bin/bash -ex

PREFIX="$1"
BIN="$2"

make build_mingw64 flexlink.exe

mkdir -p "${PREFIX}/lib/flexdll"

cp flexlink.exe             "${PREFIX}/lib/flexdll/"
cp flexdll.h                "${PREFIX}/lib/flexdll/"
cp flexdll_mingw64.o        "${PREFIX}/lib/flexdll/"
cp flexdll_initer_mingw64.o "${PREFIX}/lib/flexdll/"

ln -sf "${PREFIX}/lib/flexdll/flexlink.exe" "${BIN}/flexlink"