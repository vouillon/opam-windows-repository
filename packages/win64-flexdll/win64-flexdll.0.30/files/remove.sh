#! /bin/bash -ex

PREFIX="$1"
BIN="$2"

rm -f ${BIN}/flexlink
rm -Rf ${PREFIX}/lib/flexdll
