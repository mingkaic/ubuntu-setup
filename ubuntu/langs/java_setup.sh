#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/utils.sh

apt-add-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer

add_env_var JAVA_HOME /usr/lib/jvm/java-8-oracle
