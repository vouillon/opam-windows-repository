#! /bin/bash -ex

PREFIX="$1/x86_64-w64-mingw32"
FILES="                             \
  bin/c_rehash                      \
  bin/openssl                       \
  bin/openssl.exe                   \
  bin/libeay32.dll                  \
  bin/ssleay32.dll                  \
  include/openssl                   \
  lib/c-openssl                     \
  lib/pkgconfig/libcrypto.pc        \
  lib/pkgconfig/libssl.pc           \
  lib/pkgconfig/openssl.pc          \
  lib/engines/4758ccaeay32.dll      \
  lib/engines/chileay32.dll         \
  lib/engines/nuroneay32.dll        \
  lib/engines/aepeay32.dll          \
  lib/engines/cswifteay32.dll       \
  lib/engines/padlockeay32.dll      \
  lib/engines/atallaeay32.dll       \
  lib/engines/gmpeay32.dll          \
  lib/engines/surewareeay32.dll     \
  lib/engines/capieay32.dll         \
  lib/engines/gosteay32.dll         \
  lib/engines/ubseceay32.dll        \
  ssl"

for f in $FILES; do
  rm -Rf "$PREFIX/$f"
done
