#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/csv"

i686-w64-mingw32-ocamlc -I src/ -c -g -o src/csv.cmi src/csv.mli
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/csv.cmo src/csv.ml
i686-w64-mingw32-ocamlopt -I src/ -c -g -o src/csv.cmx src/csv.ml
i686-w64-mingw32-ocamlc -a -g src/csv.cmo -o src/csv.cma
i686-w64-mingw32-ocamlopt -a -g src/csv.cmx -o src/csv.cmxa

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/csv.cmi  "${LIB}/"
cp src/csv.cmo  "${LIB}/"
cp src/csv.cmx  "${LIB}/"
cp src/csv.cma  "${LIB}/"
cp src/csv.a    "${LIB}/"
cp src/csv.cmxa "${LIB}/"
