#!/bin/sh -e

PREFIX=$1

BINS="ocaml ocamlbuild ocamlbuild.byte ocamlc ocamlcp ocamldebug ocamldep ocamldoc ocamllex ocamlmklib ocamlmktop ocamlobjinfo ocamlopt ocamloptp ocamlprof ocamlrun ocamlyacc"

for b in $BINS; do
  rm -f "$PREFIX/bin/i686-w64-mingw32-$b"
  rm -f "$PREFIX/bin/i686-w64-mingw32/$b"
done
rm -rf "$PREFIX/i686-w64-mingw32/lib/ocaml"
rm -f "$PREFIX/i686-w64-mingw32/bin/ocamlrun"
