#!/bin/bash

source help.sh

search ()
{
	if [[ $# -ne 2 ]]
	then
		echo "Error: invalid number of arguments" 1>&2
		search_help
		exit 1
	fi

	if [[ ! -d $1 ]]
	then
		echo "Error: directory not found" 1>&2
		exit 1
	fi

	if [[ ! -r $1 ]]
	then
		echo "Error: permission denied" 1>&2
		exit 1
	fi

	grep -irn $2 $1 2>/dev/null
}
