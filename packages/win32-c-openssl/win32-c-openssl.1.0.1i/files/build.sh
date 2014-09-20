#! /bin/bash -ex

EXEC_PREFIX=i686-w64-mingw32
PREFIX="$1/$EXEC_PREFIX"
LIB="${PREFIX}/lib/c-openssl"

rm -Rf "${LIB}"
mkdir -p "${LIB}"

export CROSS_COMPILE="${EXEC_PREFIX}-"

./Configure mingw shared --prefix="$PREFIX" zlib --with-zlib-include="$PREFIX/include" --with-zlib-lib="$PREFIX/lib/c-zlib"

make
make install

mv "${PREFIX}/lib/libcrypto.dll.a" "${LIB}/"
mv "${PREFIX}/lib/libssl.dll.a"    "${LIB}/"
mv "${PREFIX}/lib/libcrypto.a"     "${LIB}/"
mv "${PREFIX}/lib/libssl.a"        "${LIB}/"
