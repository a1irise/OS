#!/bin/bash

source help.sh

strlen ()
{
	if [[ $# -ne 1 ]]
	then
		echo "Error: invalid number of arguments" 1>&2
		strlen_help
		exit 1
	fi

	str="$1"
	echo ${#str}
}
