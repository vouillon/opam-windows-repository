#! /bin/bash -ex

PREFIX="$1/i686-w64-mingw32"

FILES="bin/zlib1.dll lib/pkgconfig/zlib.pc include/zconf.h include/zlib.h"

for f in $FILES; do
  rm -f "$PREFIX/$f"
done
rm -Rf "$PREFIX/lib/c-zlib"
