#! /bin/bash -ex

PREFIX="$1"

mkdir -p "${PREFIX}/x86_64-w64-mingw32/lib"
cp -R . "${PREFIX}/x86_64-w64-mingw32/lib/gtk"
