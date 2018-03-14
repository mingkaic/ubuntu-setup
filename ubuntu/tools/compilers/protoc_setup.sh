#!/usr/bin/env bash

apt-get update && apt-get install -y autoconf automake libtool curl make g++ unzip

wget https://github.com/google/protobuf/releases/download/v3.5.1/protobuf-all-3.5.1.tar.gz
tar -xzf protobuf-all-3.5.1.tar.gz

./autogen.sh
./configure
make
make check
make install
ldconfig # refresh shared library cache.

if [ -z $(get_version "protoc --version") ]; then
    exit 1
fi
