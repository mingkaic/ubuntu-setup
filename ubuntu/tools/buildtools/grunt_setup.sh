#!/usr/bin/env bash
#
# purpose:
# this script install grunt
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../../utils/common.sh

root_check

# install grunt
npm install -g grunt-cli
