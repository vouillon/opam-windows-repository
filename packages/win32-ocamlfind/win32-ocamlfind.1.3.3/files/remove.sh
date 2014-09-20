#! /bin/bash -ex

PREFIX="$1"

MODULES="\
  bigarray camlp4 dbm dynlink graphics num num-top \
  stdlib str threads unix"

rm -f "$PREFIX/lib/findlib.conf.d/win32.conf"
rm -f "$PREFIX/i686-w64-mingw32/bin/ocamlfind"
rm -f "$PREFIX/bin/i686-w64-mingw32-ocamlfind"

for m in $MODULES; do
  rm -rf "$PREFIX/i686-w64-mingw32/lib/$m"
done
