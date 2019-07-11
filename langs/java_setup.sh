#!/usr/bin/env bash
#
# purpose:
# this script install java
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

set -e

apt-get update
apt-get install -y \
    software-properties-common \
    debconf-utils
apt-add-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y openjdk-8-jdk

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
request_save_profile "export JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\""

if [ -z $(get_version "java -version 2>&1 > /dev/null") ]; then
    exit 1
fi
