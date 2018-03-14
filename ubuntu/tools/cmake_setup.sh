#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../../utils/utils.sh

# make these parameterized later?
REQ_CMAKE_VER="3.8.2";

# check local versions
set +e
CUR_CMAKE_VER="$( cmake --version )";
set -e

function setup() {
    VERSION=$1;
    MAJOR=`expr "$VERSION" : '^\(.\d*\..\d*\)'`;
    FOLDER=cmake-$VERSION;

    cd /tmp
    apt-get purge cmake
    wget http://www.cmake.org/files/v$MAJOR/$FOLDER.tar.gz;
    tar xzf $FOLDER.tar.gz;
    cd $FOLDER
    ./bootstrap
    make -j4 && make install;
}

meets_version "$REQ_CMAKE_VER" "$CUR_CMAKE_VER" setup $REQ_CMAKE_VER;
