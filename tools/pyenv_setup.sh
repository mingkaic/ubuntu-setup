#!/usr/bin/env bash
#
# purpose:
# this script install pyenv
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

if [ -z $(get_version "python --version 2>&1") ]; then
    echo "python must be installed"
    exit 1
fi

set -e

apt-get update
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm git

yes | pip install virtualenvwrapper

PYENV=$HOME/.pyenv

if [ ! -d "$PYENV" ]; then
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    request_save_profile "export PATH=\"$PYENV/bin:\$PATH\""
    request_save_profile "eval \"\$(pyenv init -)\"\neval \"\$(pyenv virtualenv-init -)\""
fi

export PATH="$PYENV/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -z $(get_version "pyenv --version") ]; then
    exit 1
fi
