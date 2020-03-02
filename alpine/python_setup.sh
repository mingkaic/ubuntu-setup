#!/usr/bin/env sh

source "/tmp/setup/utils/common.sh"

set -e;

apk update;
apk add python3 python3-dev;

python3 --version;
pip3 --version;
meets_version "3.0.0" $(get_version "python3 --version 2>&1") exit 1;
if [ -z $(get_version "pip3 -V") ]; then
    exit 1;
fi

cp $(which python3) $(dirname $(which python3))/python;
cp $(which pip3) $(dirname $(which pip3))/pip;

set +e;
