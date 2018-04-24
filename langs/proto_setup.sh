#!/usr/bin/env bash
#
# purpose:
# this script install protobuf compiler
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

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
    unzip

TAR=protobuf-all-3.5.1.tar.gz

if [ ! -d $TMP_TAR ]; then
    wget -P $TMP_TAR https://github.com/google/protobuf/releases/download/v3.5.1/$TAR
    tar -xzf $TMP_TAR
fi

# ./autogen.sh
# ./configure
# make
# make check
# make install
# ldconfig # refresh shared library cache.

if [ -z $(get_version "protoc --version") ]; then
    exit 1
fi
