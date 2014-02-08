#!/bin/sh -e

PREFIX=$1

MODULES="\
  bigarray camlp4 dbm dynlink graphics num num-top \
  stdlib str threads unix"

rm -f "$PREFIX/lib/findlib.conf.d/win64.conf"
rm -f "$PREFIX/x86_64-w64-mingw32/bin/ocamlfind"
rm -f "$PREFIX/bin/x86_64-w64-mingw32-ocamlfind"

for m in $MODULES; do
  rm -rf "$PREFIX/x86_64-w64-mingw32/lib/$m"
done
