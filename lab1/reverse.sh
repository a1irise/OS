#!/bin/bash

if [[ $# -lt 2 ]]
then
	echo "Missing parameters, unable to execute." >&2
	./help.sh reverse
	exit
fi

if [[ ! -f $1 ]]
then
	echo "There no file with that name." >&2
	exit
fi

if [[ ! -r $1 ]]
then
	echo "You don't have permission to look at that file." >&2
	exit
fi

touch $2

if [[ ! -w $2 ]]
then
	echo "You don't have permission to write in that file." >&2
	exit
fi

tac $1 > temp.txt
rev temp.txt > $2

rm temp.txt
