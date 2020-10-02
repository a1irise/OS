#!/bin/bash

[[ $# -lt 1 ]] && exit 0

if [[ $1 -lt 0 || $1 -gt 255 ]]
then
	echo "Invalid parameter value, unable to execute." >&2
	./help.sh custom_exit
	exit
fi

exit $1
