#!/usr/bin/env bash
#
# purpose:
# this script sets up development environment 
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/utils/common.sh

root_check

mkdir -p $HOME/Developer
mkdir -p $HOME/Tools
mkdir -p $HOME/cfg-backup

request_save_profile "export CFG_BACKUP=\$HOME/cfg-backup"
