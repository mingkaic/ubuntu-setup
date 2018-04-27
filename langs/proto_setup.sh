#!/usr/bin/env bash
#
# purpose:
# this script install protobuf compiler
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

set -e

apt-get update
apt-get install -y \
    autoconf \
    automake \
    libtool \
    curl \
    make \
    g++ \
    unzip \
    wget

TAR=v3.5.1.tar.gz
TMP_TAR=/tmp/$TAR
if [ ! -d $TMP_TAR ]; then
    wget https://github.com/google/protobuf/archive/$TAR -O $TMP_TAR
    tar -xzf $TMP_TAR -C /tmp
fi

pushd /tmp/protobuf-3.5.1
./autogen.sh
./configure
make
make check
make install
ldconfig # refresh shared library cache.
popd

if [ -z $(get_version "protoc --version") ]; then
    exit 1
fi
