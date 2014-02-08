#!/bin/sh -e

PREFIX="$1/i686-w64-mingw32"
FILES="\
  bin/c_rehash bin/openssl bin/libeay32.dll bin/ssleay32.dll \
  include/openssl \
  lib/libcrypto.a lib/libssl.a \
  lib/pkgconfig/libcrypto.pc lib/pkgconfig/libssl.pc lib/pkgconfig/openssl.pc \
  ssl"

for f in $FILES; do
  echo Removing $PREFIX/$f...
  rm -Rf "$PREFIX/$f"
done
