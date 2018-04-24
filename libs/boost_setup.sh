#!/usr/bin/env bash
#
# purpose:
# this script install java
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

wget 'https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.bz2/download'
tar -xf download

cd boost_1_64_0
./bootstrap.sh
./bjam install
ldconfig
