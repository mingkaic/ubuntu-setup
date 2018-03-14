#!/usr/bin/env bash
#
# purpose:
# this script defines popular functions
#

# executes command CMD if required REQ_VER is greater than CUR_VER
function meets_version() {
	REQ_VER=$1;
	CUR_VER=$2;
	CMD=${@:3:$#-2};
	if [ -z $CUR_VER ] || [ "$(printf "$REQ_VER\n$CUR_VER" | sort -V | head -n1)" == "$CUR_VER" ] && [ "$CUR_VER" != "$REQ_VER" ];
	then
		eval "$CMD";
	else
		echo "requirement: $REQ_VER met. current version: $CUR_VER";
	fi
}

function get_version() {
	eval "$1" | grep -E -o "([0-9]{1,}\.)+[0-9]{1,}"
}

function add_env_var() {
	echo "export $1=$2" >> ~/.bashrc
}

function add_PATH() {
	echo "export PATH=$1:$PATH"
}
