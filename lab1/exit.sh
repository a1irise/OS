#!/bin/bash

[[ $# -eq 0 ]] && exit 0

if [[ $# -gt 1 ]]
then
	echo "Error: invalid number of arguments" 1>&2
	./help.sh custom_exit
	exit 1
fi

if [[ ! $1 =~ ^[0-9]+$ || $1 -lt 0 || $1 -gt 255 ]]
then
	echo "Error: invalid parameter value" >&2
	./help.sh custom_exit
	exit 1
fi

exit $1
