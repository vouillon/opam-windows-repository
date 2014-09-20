#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/batteries"

ocaml str.cma build/prefilter.ml < src/batMarshal.mliv > src/batMarshal.mli
ocaml str.cma build/prefilter.ml < src/batUnix.mliv > src/batUnix.mli
ocaml str.cma build/prefilter.ml < src/batPervasives.mliv > src/batPervasives.mli
ocaml str.cma build/prefilter.ml < src/batInnerPervasives.mlv > src/batInnerPervasives.ml
ocaml str.cma build/prefilter.ml < src/batHashtbl.mlv > src/batHashtbl.ml
ocaml str.cma build/prefilter.ml < src/batPrintexc.mliv > src/batPrintexc.mli
ocaml str.cma build/prefilter.ml < src/batSys.mliv > src/batSys.mli
ocaml str.cma build/prefilter.ml < src/batBigarray.mliv > src/batBigarray.mli

ocamlopt -I "${PREFIX}/lib/ocaml/ocamlbuild" unix.cmxa "${PREFIX}/lib/ocaml/ocamlbuild/ocamlbuildlib.cmxa" myocamlbuild.ml "${PREFIX}/lib/ocaml/ocamlbuild/ocamlbuild.cmx" -o myocamlbuild
ocamlfind ocamlc -linkpkg -package bigarray,num,str build/mkconf.ml -o build/mkconf.byte
rm myocamlbuild.{o,cmi,cmx} build/mkconf.{cmi,cmo}

./myocamlbuild -no-plugin -classic-display -no-links \
  -ocamlc   'i686-w64-mingw32-ocamlfind ocamlc'      \
  -ocamlopt 'i686-w64-mingw32-ocamlfind ocamlopt'    \
  src/batteries.cma                                  \
  src/batteriesHelp.cmo                              \
  src/batteriesThread.cma                            \
  src/batteries.cmxs                                 \
  src/batteriesThread.cmxs                           \
  META

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp _build/src/*.{cmi,cmo,cmx,cmxa,cmxs,o,a} "${LIB}/"
