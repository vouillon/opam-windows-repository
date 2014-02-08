#!/bin/sh -e

PREFIX=$1/i686-w64-mingw32

FILES="bin/zlib1.dll lib/libz.a lib/libz.dll.a \
       lib/pkgconfig/zlib.pc include/zconf.h include/zlib.h"

for f in $FILES; do
  echo Removing $PREFIX/$f...
  rm -f "$PREFIX/$f"
done
