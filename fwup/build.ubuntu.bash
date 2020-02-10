#!/bin/bash -ex

# Following this guide:
# https://github.com/fhunleth/fwup/blob/master/docs/build_linux.md

FWUP_URL=${FWUP_RUL:-'https://github.com/fhunleth/fwup'}
CONFUSE=${CONFUSE:-'confuse-3.0'}
CONFUSE_URL=${CONFUSE_URL:-"https://github.com/martinh/libconfuse/releases/download/v3.0/$CONFUSE.tar.gz"}
TMP_DIR=${TMP_DIR:-$(dirname "$(mktemp --dry-run)")}

try-sudo() {
  sudo=$(command -v sudo || echo '')
  eval "$sudo" "$@"
}

install-with-apt() {
  try-sudo apt-get -qq update && try-sudo apt-get -qq install -y "$@"
}

build_dep_apts=(
  autoconf
  build-essential
  curl
  git
  help2man
  libtool
  mtools
  pkg-config
  unzip
  zip
)

shared_lib_apts=(
  libarchive-dev
  libsodium-dev
)

try-sudo apt-get update
try-sudo apt-get install -y "${build_dep_apts[@]}" "${shared_lib_apts[@]}"

confuse_tmp=$(mktemp --directory "$TMP_DIR/confuse.XXX")
curl -sL "$CONFUSE_URL" | tar -xzv -C "$confuse_tmp"
(
  cd "$confuse_tmp/$CONFUSE"
  ./configure
  make
  try-sudo make install
)
rm -rf "$confuse_tmp"

fwup_tmp=$(mktemp --directory "$TMP_DIR/fwup.XXX")
git clone --depth=1 "$FWUP_URL" "$fwup_tmp"
(
  cd "$fwup_tmp"
  bash ./scripts/download_deps.sh
  bash ./scripts/build_deps.sh
  bash ./autogen.sh
  PKG_CONFIG_PATH=$fwup_tmp/build/host/deps/usr/lib/pkgconfig \
    ./configure --enable-shared=no
  make
  try-sudo make install
)
rm -rf "$fwup_tmp"
