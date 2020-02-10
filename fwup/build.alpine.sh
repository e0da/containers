#!/bin/sh

set -ex

BUILD_DEPS=.build-deps
GLIBC_KEY=/etc/apk/keys/sgerrand.rsa.pub
GLIBC_KEY_URL=https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
GLIBC_APK=glibc-2.30-r0.apk
GLIBC_APK_URL=https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/$GLIBC_APK
CONFUSE=confuse-3.0
CONFUSE_URL=https://github.com/martinh/libconfuse/releases/download/v3.0/$CONFUSE.tar.gz
CONFUSE_TMP=/tmp/$CONFUSE
FWUP_URL=https://github.com/fhunleth/fwup
FWUP_TMP=/tmp/fwup

# https://github.com/sgerrand/alpine-pkg-glibc
apk --no-cache add --virtual $BUILD_DEPS ca-certificates curl
curl -sL $GLIBC_KEY_URL > $GLIBC_KEY
curl -sLOJ  $GLIBC_APK_URL
apk add $GLIBC_APK
rm $GLIBC_APK

# https://github.com/fhunleth/fwup/blob/master/docs/build_linux.md
apk --no-cache add --virtual $BUILD_DEPS \
  autoconf automake bash curl file g++ git libtool linux-headers make pkgconf
apk --no-cache add libarchive-dev libsodium-dev
curl -sL $CONFUSE_URL | tar -xz -C /tmp
(
  cd $CONFUSE_TMP
  ./configure
  make
  make install
)
rm -rf $CONFUSE_TMP
git clone $FWUP_URL /tmp/fwup
(
  cd $FWUP_TMP
  bash ./scripts/download_deps.sh
  bash ./scripts/build_deps.sh
  bash ./autogen.sh
  PKG_CONFIG_PATH=$FWUP_TMP/build/host/deps/usr/lib/pkgconfig \
    ./configure --enable-shared=no
  make
  make install
)
rm -rf $FWUP_TMP

apk --no-cache del $BUILD_DEPS
