#! /bin/bash -ex

PREFIX="$1"

x86_64-w64-mingw32-windres win32rc/unison.res win32rc/unison.res.lib
make UISTYLE=text OCAMLOPT=x86_64-w64-mingw32-ocamlopt OSARCH=win32gnuc
x86_64-w64-mingw32-strip unison.exe

cp unison.exe "${PREFIX}/x86_64-w64-mingw32/bin/"
