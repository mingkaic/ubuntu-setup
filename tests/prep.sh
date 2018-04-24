#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cat $THIS_DIR/orig_pend | tee /tmp/prepend_test /tmp/append_test > /dev/null
