#!/usr/bin/env bash
#
# purpose:
# this script install llvm
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

set -e

apt-get update
apt-get install -y \
    software-properties-common \
    wget

wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
apt-add-repository -y "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main"
apt-get update
apt-get install -y clang-5.0 lldb-5.0 lld-5.0

# exit 1 if clang-5.0 isn't at least 5.0.0 (LOL) 
meets_version "5.0.0" $(get_version "clang-5.0 -v 2>&1") exit 1
