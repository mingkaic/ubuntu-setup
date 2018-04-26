#!/usr/bin/env bash
#
# purpose:
# this script install g++ compiler supporting c++11
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

set -e

apt-get update
apt-get install -y clang

if [ -z $(get_version "clang -v 2>&1") ]; then
    exit 1
fi
