#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/zip"

rm -Rf "${LIB}"
