#!/usr/bin/env sh

source "/tmp/setup/utils/common.sh"

set -e;

apk update;
apk add clang;

clang -v;
if [ -z $(get_version "clang -v 2>&1") ]; then
    exit 1;
fi

set +e;
