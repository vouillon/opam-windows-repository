#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/ppx_deriving"

x86_64-w64-mingw32-ocamlc -c -g -bin-annot -safe-string -w @5@8@10@11@12@14@23@24@26@29@40 -I src -o src/ppx_deriving_runtime.cmi src/ppx_deriving_runtime.mli
x86_64-w64-mingw32-ocamlc -c -g -bin-annot -safe-string -w @5@8@10@11@12@14@23@24@26@29@40 -I src -o src/ppx_deriving_runtime.cmo src/ppx_deriving_runtime.ml
x86_64-w64-mingw32-ocamlc -a src/ppx_deriving_runtime.cmo -o src/ppx_deriving_runtime.cma

x86_64-w64-mingw32-ocamlopt -c -g -bin-annot -safe-string -w @5@8@10@11@12@14@23@24@26@29@40 -I src -o src/ppx_deriving_runtime.cmx src/ppx_deriving_runtime.ml
x86_64-w64-mingw32-ocamlopt -a src/ppx_deriving_runtime.cmx -o src/ppx_deriving_runtime.cmxa
x86_64-w64-mingw32-ocamlopt -shared src/ppx_deriving_runtime.cmx -o src/ppx_deriving_runtime.cmxs

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/ppx_deriving_runtime.cmi  "${LIB}/"
cp src/ppx_deriving_runtime.cmo  "${LIB}/"
cp src/ppx_deriving_runtime.cmx  "${LIB}/"
cp src/ppx_deriving_runtime.cma  "${LIB}/"
cp src/ppx_deriving_runtime.a    "${LIB}/"
cp src/ppx_deriving_runtime.cmxa "${LIB}/"
