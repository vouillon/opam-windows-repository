#! /bin/bash -ex

PREFIX="$1"

ocamlfind -toolchain win64 remove lablgtk2
rm -f "${PREFIX}/x86_64-w64-mingw32/bin/lablgtk2"
rm -f "${PREFIX}/x86_64-w64-mingw32/bin/gdk_pixbuf_mlsource"
