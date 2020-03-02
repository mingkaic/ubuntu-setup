#!/usr/bin/env sh

source "/tmp/setup/utils/common.sh"

set -e;

apk update;
apk add openjdk8-jre;

export JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk";

java -version;
if [ -z $(get_version "java -version 2>&1 > /dev/null") ]; then
    exit 1;
fi

set +e;
