#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/ppx_deriving"

rm -Rf "${LIB}"
