#!/bin/bash

while true
do
	read line
	echo $line > pipe
	[[ $line == "QUIT" ]] && exit 0
	[[ $line != "+" && $line != "*" && ! $line =~ ^[0-9]+$ ]] && exit 1
done
