#!/bin/bash

source help.sh

reverse ()
{
	if [[ $# -ne 2 ]]
	then
		echo "Error: invalid number of argumets" 1>&2
		reverse_help
		exit 1
	fi

	if [[ ! -f $1 ]]
	then
		echo "Error: file not found $1" 1>&2
		exit 1
	fi

	if [[ ! -r $1 ]]
	then
		echo "Error: permission denied $1" 1>&2
		exit 1
	fi

	touch $2

	if [[ ! -w $2 ]]
	then
		echo "Error: permission denied $2" 1>&2
		exit 1
	fi

	tac $1 > temp.txt
	rev temp.txt > $2

	rm temp.txt
}
