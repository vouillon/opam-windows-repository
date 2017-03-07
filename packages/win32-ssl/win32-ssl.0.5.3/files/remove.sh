#! /bin/bash -ex

PREFIX="$1"

ocamlfind -toolchain win32 remove ssl
rm -f "${PREFIX}/i686-w64-mingw32/bin/openssl.exe"
