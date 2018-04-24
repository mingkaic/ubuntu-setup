#!/usr/bin/env bash
#
# purpose:
# this script install java
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

set -e

apt-add-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer

add_env_var JAVA_HOME /usr/lib/jvm/java-8-oracle

source ~/.bashrc
if [ -z $(get_version "java -version 2>&1 > /dev/null") ]; then
    exit 1
fi
