#! /bin/bash -ex

BIN="$1"

oasis setup
findlib_version=$("${BIN}/ocamlfind" query -format "%v" findlib) \
ocaml setup.ml -configure                                        \
     --override ocamlfind "${BIN}/i686-w64-mingw32-ocamlfind"    \
     --override os_type Win32 --disable-pthread --disable-libev  \
     --enable-ssl
ocaml setup.ml -build
ocaml setup.ml -install
