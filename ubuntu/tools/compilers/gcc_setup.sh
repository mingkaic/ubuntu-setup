#!/usr/bin/env

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../../utils/utils.sh

# make these parameterized later?
REQ_GCC_VER="6.0.0";
REQ_GPP_VER="6.0.0";

# check local versions
set +e
CUR_GCC_VER="$( gcc -dumpversion )";
CUR_GPP_VER="$( g++ -dumpversion )";
set -e

meets_version "$REQ_GCC_VER" "$CUR_GCC_VER" "apt-get install -y gcc-6 && rm /usr/bin/gcc && mv /usr/bin/gcc-6 /usr/bin/gcc";
meets_version "$REQ_GPP_VER" "$CUR_GPP_VER" "apt-get install -y g++-6 && rm /usr/bin/g++ && mv /usr/bin/g++-6 /usr/bin/g++";
