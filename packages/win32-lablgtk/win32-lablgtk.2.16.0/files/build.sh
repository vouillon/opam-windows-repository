#! /bin/bash -ex

PREFIX="$1"

cp config.make.mingw config.make
make -C src propcc varcc CAMLC=ocamlc
make world
make install PATH="${PREFIX}/i686-w64-mingw32/bin:${PATH}"
