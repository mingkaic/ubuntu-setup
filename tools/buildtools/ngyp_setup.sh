#!/usr/bin/env bash
#
# purpose:
# this script install node-gyp
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../../utils/common.sh

root_check

npm install -g node-gyp
