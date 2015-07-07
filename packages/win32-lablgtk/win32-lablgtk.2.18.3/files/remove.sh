#! /bin/bash -ex

PREFIX="$1"

ocamlfind -toolchain win32 remove lablgtk2
rm -f "${PREFIX}/i686-w64-mingw32/bin/lablgtk2"
rm -f "${PREFIX}/i686-w64-mingw32/bin/gdk_pixbuf_mlsource"
