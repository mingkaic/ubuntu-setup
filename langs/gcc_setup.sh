#!/usr/bin/env bash
#
# purpose:
# this script install g++ compiler supporting c++11
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

# make these parameterized later?
REQ_GCC_VER="6.0.0";
REQ_GPP_VER="6.0.0";

# check local versions
set +e
CUR_GCC_VER="$( gcc -dumpversion )";
CUR_GPP_VER="$( g++ -dumpversion )";
set -e

apt-get update
meets_version "$REQ_GCC_VER" "$CUR_GCC_VER" "apt-get install -y gcc-6 && rm /usr/bin/gcc && mv /usr/bin/gcc-6 /usr/bin/gcc";
meets_version "$REQ_GPP_VER" "$CUR_GPP_VER" "apt-get install -y g++-6 && rm /usr/bin/g++ && mv /usr/bin/g++-6 /usr/bin/g++";

if [ -z $(get_version "gcc -v") ]; then
    exit 1
fi
