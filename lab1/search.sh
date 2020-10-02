#!/bin/bash

if [[ $# -lt 2 ]]
then
	echo "Missing parameters, unable to execute." >&2
	./help.sh search
	exit
fi

if [[ ! -d $1 ]]
then
	echo "There is no directory with that name." >&2
	exit
fi

if [[ ! -r $1 ]]
then
	echo "You don't have access to that directory." >&2
	exit
fi

grep -irn $2 $1
