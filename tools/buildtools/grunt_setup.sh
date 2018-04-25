#!/usr/bin/env bash
#
# purpose:
# this script install grunt
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../../utils/common.sh

root_check

set -e

if [ -z $(get_version "node -v") ]; then
    exit 1
fi

# install grunt
npm install -g grunt-cli

if [ -z $(get_version "grunt -v") ]; then
    exit 1
fi
