#!/bin/bash

reverse ()
{
	if [[ ! -f $1 ]]
	then
		echo "Error: $1 not found" 1>&2
		exit 1
	fi

	if [[ ! -f $2 ]]
	then
		touch $2
	fi

	if [[ ! -r $1 || ! -w $2 ]]
	then
		echo "Error: permission denied" 1>&2
		exit 1
	fi

	tac $1 > temp.txt
	rev temp.txt > $2

	rm temp.txt
}
