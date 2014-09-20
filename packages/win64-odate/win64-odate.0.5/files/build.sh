#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/odate"

x86_64-w64-mingw32-ocamlc -c -g -I src -o src/oDuration.cmi src/oDuration.mli
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/oDate.cmi src/oDate.mli
x86_64-w64-mingw32-ocamllex -q src/date_lexer.mll
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/date_lexer.cmo src/date_lexer.ml
x86_64-w64-mingw32-ocamllex -q src/duration_lexer.mll
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/duration_private.cmo src/duration_private.ml
menhir --ocamlc 'x86_64-w64-mingw32-ocamlc -I src' --infer src/duration_parser.mly
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/duration_parser.cmi src/duration_parser.mli
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/duration_lexer.cmo src/duration_lexer.ml
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/oDate.cmo src/oDate.ml
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/oDuration.cmo src/oDuration.ml
x86_64-w64-mingw32-ocamlc -c -g -I src -o src/duration_parser.cmo src/duration_parser.ml
x86_64-w64-mingw32-ocamlc -a src/date_lexer.cmo src/duration_private.cmo src/duration_parser.cmo src/duration_lexer.cmo src/oDuration.cmo src/oDate.cmo -o src/odate.cma
x86_64-w64-mingw32-ocamlopt -c -g -I src -o src/duration_private.cmx src/duration_private.ml
x86_64-w64-mingw32-ocamlopt -c -g -I src -o src/duration_parser.cmx src/duration_parser.ml
x86_64-w64-mingw32-ocamlopt -c -g -I src -o src/duration_lexer.cmx src/duration_lexer.ml
x86_64-w64-mingw32-ocamlopt -c -g -I src -o src/date_lexer.cmx src/date_lexer.ml
x86_64-w64-mingw32-ocamlopt -c -g -I src -o src/oDuration.cmx src/oDuration.ml
x86_64-w64-mingw32-ocamlopt -c -g -I src -o src/oDate.cmx src/oDate.ml
x86_64-w64-mingw32-ocamlopt -a src/date_lexer.cmx src/duration_private.cmx src/duration_parser.cmx src/duration_lexer.cmx src/oDuration.cmx src/oDate.cmx -o src/odate.cmxa
x86_64-w64-mingw32-ocamlopt -shared src/odate.cmxa src/date_lexer.cmx src/duration_private.cmx src/duration_parser.cmx src/duration_lexer.cmx src/oDuration.cmx src/oDate.cmx -o src/odate.cmxs

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/date_lexer.cmx       "${LIB}/"
cp src/duration_parser.cmx  "${LIB}/"
cp src/odate.cma            "${LIB}/"
cp src/oDate.cmx            "${LIB}/"
cp src/odate.cmxs           "${LIB}/"
cp src/oDuration.cmi        "${LIB}/"
cp src/oDuration.mli        "${LIB}/"
cp src/duration_lexer.cmx   "${LIB}/"
cp src/duration_private.cmx "${LIB}/"
cp src/odate.a              "${LIB}/"
cp src/oDate.cmi            "${LIB}/"
cp src/odate.cmxa           "${LIB}/"
cp src/oDate.mli            "${LIB}/"
cp src/oDuration.cmx        "${LIB}/"
