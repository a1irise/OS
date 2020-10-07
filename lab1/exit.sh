#!/bin/bash

custom_exit ()
{
	[[ $# -eq 0 ]] && exit 0

	if [[ ! $1 =~ ^[0-9]+$ || $1 -lt 0 || $1 -gt 255 ]]
	then
		echo "Error: invalid parameter value" 1>&2
		custom_exit_help
		exit 1
	fi

	exit $1
}
