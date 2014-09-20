#! /bin/bash -ex

PREFIX="$1"

mkdir -p "${PREFIX}/i686-w64-mingw32/lib"
cp -R . "${PREFIX}/i686-w64-mingw32/lib/gtk"
