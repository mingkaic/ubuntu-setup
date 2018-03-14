#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/utils.sh

apt-get install \
    git make \
    build-essential \
    libssl-dev \
    python-pip \
	python-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev

easy_install pip
pip install virtualenvwrapper

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

add_env_var PYENV_ROOT $HOME/.pyenv
add_PATH "\$PYENV_ROOT/bin"
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'pyenv virtualenvwrapper' >> ~/.bashrc

source ~/.bashrc
if [ -z $(get_version "python -V") ]; then
    exit 1
fi
