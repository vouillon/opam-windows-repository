#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/result"

cp "$(ocaml which_result.ml)" result.ml

x86_64-w64-mingw32-ocamlc -c result.ml
x86_64-w64-mingw32-ocamlc -a -o result.cma result.cmo
x86_64-w64-mingw32-ocamlopt -c result.ml
x86_64-w64-mingw32-ocamlopt -a -o result.cmxa result.cmx
x86_64-w64-mingw32-ocamlopt -shared -linkall -o result.cmxs result.cmxa

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp result.* "${LIB}"
