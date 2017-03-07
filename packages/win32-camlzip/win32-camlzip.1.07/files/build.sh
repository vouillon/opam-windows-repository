#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/zip"
ZLIB="${PREFIX}/i686-w64-mingw32/lib/c-zlib"

i686-w64-mingw32-ocamlc -g -c -ccopt -g -ccopt -I"${ZLIB}" zlibstubs.c
i686-w64-mingw32-ocamlmklib -oc camlzip zlibstubs.o -L"${ZLIB}" -lz
i686-w64-mingw32-ocamlc -g -c zlib.mli
i686-w64-mingw32-ocamlc -g -c zlib.ml
i686-w64-mingw32-ocamlc -g -c zip.mli
i686-w64-mingw32-ocamlc -g -c zip.ml
i686-w64-mingw32-ocamlc -g -c gzip.mli
i686-w64-mingw32-ocamlc -g -c gzip.ml
i686-w64-mingw32-ocamlmklib -o zip -oc camlzip zlib.cmo zip.cmo gzip.cmo -L"${ZLIB}" -lz
i686-w64-mingw32-ocamlopt -c zlib.ml
i686-w64-mingw32-ocamlopt -c zip.ml
i686-w64-mingw32-ocamlopt -c gzip.ml
i686-w64-mingw32-ocamlmklib -o zip -oc camlzip zlib.cmx zip.cmx gzip.cmx -L"${ZLIB}" -lz

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp gzip.cmi     "${LIB}/"
cp gzip.cmx     "${LIB}/"
cp gzip.mli     "${LIB}/"
cp libcamlzip.a "${LIB}/"
cp zip.a        "${LIB}/"
cp zip.cma      "${LIB}/"
cp zip.cmi      "${LIB}/"
cp zip.cmx      "${LIB}/"
cp zip.cmxa     "${LIB}/"
cp zip.mli      "${LIB}/"
cp zlib.cmi     "${LIB}/"
cp zlib.cmx     "${LIB}/"
cp zlib.mli     "${LIB}/"
