#!/usr/bin/env bash
#
# purpose:
# this script install cmake
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

# make these parameterized later?
REQ_CMAKE_VER="3.8.2";

# check local versions
set +e
CUR_CMAKE_VER="$( cmake --version )";
set -e

# we need gcc compiler
if [ -z $(get_version "g++ -v 2>&1") ]; then
    exit 1
fi

apt-get update
apt-get install -y wget

function setup() {
    VERSION=$1;
    MAJOR=`expr "$VERSION" : '^\(.\d*\..\d*\)'`;
    FOLDER=cmake-$VERSION;

    apt-get purge cmake
    wget http://www.cmake.org/files/v$MAJOR/$FOLDER.tar.gz -P /tmp
    tar xzf /tmp/$FOLDER.tar.gz -C /tmp
    pushd /tmp/$FOLDER
    ./bootstrap
    make -j4 && make install
    popd
}

meets_version "$REQ_CMAKE_VER" "$CUR_CMAKE_VER" setup $REQ_CMAKE_VER;

if [ -z $(get_version "cmake --version") ]; then
    exit 1
fi
