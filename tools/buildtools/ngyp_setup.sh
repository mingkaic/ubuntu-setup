#!/usr/bin/env bash
#
# purpose:
# this script install node-gyp
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../../utils/common.sh

root_check

set -e

if [ -z $(get_version "node -v") ]; then
    exit 1
fi

npm install -g node-gyp

if [ -z $(get_version "node-gyp -v") ]; then
    exit 1
fi
