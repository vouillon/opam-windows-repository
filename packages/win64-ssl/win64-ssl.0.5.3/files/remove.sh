#! /bin/bash -ex

PREFIX="$1"

ocamlfind -toolchain win64 remove ssl
rm -f "${PREFIX}/x86_64-w64-mingw32/bin/openssl.exe"
