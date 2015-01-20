#! /bin/bash -ex

PREFIX="$1"

make UISTYLE=gtk2 OCAMLOPT="i686-w64-mingw32-ocamlopt -I +../lablgtk2" OSARCH=win32gnuc
i686-w64-mingw32-strip unison.exe
cp unison.exe "${PREFIX}/i686-w64-mingw32/bin/unison-gtk.exe"
