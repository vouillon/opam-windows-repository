#! /bin/bash -ex

PREFIX="$1/x86_64-w64-mingw32"

make -C src/ all     MINGW_BASE=x86_64-w64-mingw32 PREFIX="${PREFIX}"
make -C src/ install MINGW_BASE=x86_64-w64-mingw32 PREFIX="${PREFIX}"
