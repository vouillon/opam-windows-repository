#! /bin/bash -ex

PREFIX="$1/i686-w64-mingw32"

make -C src/ all     MINGW_BASE=i686-w64-mingw32 PREFIX="${PREFIX}"
make -C src/ install MINGW_BASE=i686-w64-mingw32 PREFIX="${PREFIX}"
