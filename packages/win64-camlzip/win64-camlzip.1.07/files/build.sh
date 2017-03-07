#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/zip"
ZLIB="${PREFIX}/x86_64-w64-mingw32/lib/c-zlib"

x86_64-w64-mingw32-ocamlc -g -c -ccopt -g -ccopt -I"${ZLIB}" zlibstubs.c
x86_64-w64-mingw32-ocamlmklib -oc camlzip zlibstubs.o -L"${ZLIB}" -lz
x86_64-w64-mingw32-ocamlc -g -c zlib.mli
x86_64-w64-mingw32-ocamlc -g -c zlib.ml
x86_64-w64-mingw32-ocamlc -g -c zip.mli
x86_64-w64-mingw32-ocamlc -g -c zip.ml
x86_64-w64-mingw32-ocamlc -g -c gzip.mli
x86_64-w64-mingw32-ocamlc -g -c gzip.ml
x86_64-w64-mingw32-ocamlmklib -o zip -oc camlzip zlib.cmo zip.cmo gzip.cmo -L"${ZLIB}" -lz
x86_64-w64-mingw32-ocamlopt -c zlib.ml
x86_64-w64-mingw32-ocamlopt -c zip.ml
x86_64-w64-mingw32-ocamlopt -c gzip.ml
x86_64-w64-mingw32-ocamlmklib -o zip -oc camlzip zlib.cmx zip.cmx gzip.cmx -L"${ZLIB}" -lz

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
