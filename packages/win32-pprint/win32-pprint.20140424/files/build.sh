#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/i686-w64-mingw32/lib/pprint"

i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintRenderer.cmo src/PPrintRenderer.ml
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintEngine.cmi src/PPrintEngine.mli
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintCombinators.cmi src/PPrintCombinators.mli
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintOCaml.cmi src/PPrintOCaml.mli
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrint.cmo src/PPrint.ml
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintCombinators.cmo src/PPrintCombinators.ml
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintEngine.cmo src/PPrintEngine.ml
i686-w64-mingw32-ocamlc -I src/ -c -g -o src/PPrintOCaml.cmo src/PPrintOCaml.ml
i686-w64-mingw32-ocamlc -a -g src/PPrintRenderer.cmo src/PPrintEngine.cmo src/PPrintCombinators.cmo src/PPrintOCaml.cmo src/PPrint.cmo -o src/PPrintLib.cma
i686-w64-mingw32-ocamlopt -I src/ -c -g -o src/PPrintRenderer.cmx src/PPrintRenderer.ml
i686-w64-mingw32-ocamlopt -I src/ -c -g -o src/PPrintEngine.cmx src/PPrintEngine.ml
i686-w64-mingw32-ocamlopt -I src/ -c -g -o src/PPrintCombinators.cmx src/PPrintCombinators.ml
i686-w64-mingw32-ocamlopt -I src/ -c -g -o src/PPrintOCaml.cmx src/PPrintOCaml.ml
i686-w64-mingw32-ocamlopt -I src/ -c -g -o src/PPrint.cmx src/PPrint.ml
i686-w64-mingw32-ocamlopt -a -g src/PPrintRenderer.cmx src/PPrintEngine.cmx src/PPrintCombinators.cmx src/PPrintOCaml.cmx src/PPrint.cmx -o src/PPrintLib.cmxa

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/PPrint.cmi            "${LIB}/"
cp src/PPrintCombinators.cmi "${LIB}/"
cp src/PPrintCombinators.o   "${LIB}/"
cp src/PPrintEngine.cmx      "${LIB}/"
cp src/PPrintLib.a           "${LIB}/"
cp src/PPrintLib.cmxa        "${LIB}/"
cp src/PPrintOCaml.cmo       "${LIB}/"
cp src/PPrintRenderer.cmi    "${LIB}/"
cp src/PPrintRenderer.o      "${LIB}/"
cp src/PPrint.cmo            "${LIB}/"
cp src/PPrintCombinators.cmo "${LIB}/"
cp src/PPrintEngine.cmi      "${LIB}/"
cp src/PPrintEngine.o        "${LIB}/"
cp src/PPrint.o              "${LIB}/"
cp src/PPrintOCaml.cmx       "${LIB}/"
cp src/PPrintRenderer.cmo    "${LIB}/"
cp src/PPrint.cmx            "${LIB}/"
cp src/PPrintCombinators.cmx "${LIB}/"
cp src/PPrintEngine.cmo      "${LIB}/"
cp src/PPrintLib.cma         "${LIB}/"
cp src/PPrintOCaml.cmi       "${LIB}/"
cp src/PPrintOCaml.o         "${LIB}/"
cp src/PPrintRenderer.cmx    "${LIB}/"
