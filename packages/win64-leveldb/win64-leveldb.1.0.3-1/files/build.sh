#! /bin/bash -ex

PREFIX="$1"
LIB="${PREFIX}/x86_64-w64-mingw32/lib/leveldb"
C_LEVELDB_LIB="${PREFIX}/x86_64-w64-mingw32/lib/c-leveldb"

x86_64-w64-mingw32-ocamlopt -cc x86_64-w64-mingw32-g++ -ccopt -I"${C_LEVELDB_LIB}" src/leveldb_stubs.c
x86_64-w64-mingw32-ocamlopt -thread -c src/levelDB.mli
x86_64-w64-mingw32-ocamlopt -thread -c -I src/ src/levelDB.ml
x86_64-w64-mingw32-ocamlc   -thread -c -I src/ src/levelDB.ml
x86_64-w64-mingw32-ocamlmklib -oc camlleveldb -o leveldb -L"${C_LEVELDB_LIB}" -lleveldb -lstdc++ -lm leveldb_stubs.o src/levelDB.cmo src/levelDB.cmx

rm -Rf   "${LIB}"
mkdir -p "${LIB}"

cp src/levelDB.mli  "${LIB}/"
cp src/levelDB.cmi  "${LIB}/"
cp src/levelDB.cmx  "${LIB}/"
cp leveldb.cma      "${LIB}/"
cp leveldb.cmxa     "${LIB}/"
cp leveldb.a        "${LIB}/"
cp libcamlleveldb.a "${LIB}/"
