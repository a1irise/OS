#!/bin/bash

if [[ $# -lt 1 ]]
then
	echo "You didn't enter a string, nothing to count." >&2
	exit
fi

str="$1"
echo ${#str}
