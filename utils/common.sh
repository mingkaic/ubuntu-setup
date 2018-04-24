#!/usr/bin/env bash
#
# purpose:
# this script defines popular functions
#

function timestamp {
  date +"%T"
}

function root_check {
	if [ "$EUID" -ne 0 ]; then
		echo "Please run as root"
		exit
	fi
}

# executes command CMD if required REQ_VER is greater than CUR_VER
function meets_version {
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

function get_version {
	eval "$@" | grep -Eo -m 1 "([0-9]{1,}\.)+[0-9]{1,}"
}

function request_save_profile {
	backup ~/.bashrc bashrc
	save_profile $@
}

function save_profile {
	printf $@ >> ~/.bashrc
}

function backup {
	cp $1 $HOME/cfg-backup/$2-$(timestamp)
}
