#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/xmlm"

x86_64-w64-mingw32-ocamlc   -I src/ -c -g -o src/xmlm.cmi src/xmlm.mli
x86_64-w64-mingw32-ocamlc   -I src/ -c -g -o src/xmlm.cmo src/xmlm.ml
x86_64-w64-mingw32-ocamlopt -I src/ -c -g -o src/xmlm.cmx src/xmlm.ml
x86_64-w64-mingw32-ocamlc   -a -g src/xmlm.cmo -o src/xmlm.cma
x86_64-w64-mingw32-ocamlopt -a -g src/xmlm.cmx -o src/xmlm.cmxa

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/xmlm.cmi  "${LIB}/"
cp src/xmlm.cmo  "${LIB}/"
cp src/xmlm.cmx  "${LIB}/"
cp src/xmlm.cma  "${LIB}/"
cp src/xmlm.a    "${LIB}/"
cp src/xmlm.cmxa "${LIB}/"
