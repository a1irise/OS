#!/bin/bash

mode="+"
res=1

(tail -f pipe) |
while true
do
	read line

	case "$line" in
	"+")
		mode="+"
		;;
	"*")
		mode="*"
		;;
	[0-9]*)
		case $mode in
		"+")
			res=$((res + line))
			echo $res
			;;
		"*")
			res=$((res * line))
			echo $res
			;;
		esac
		;;
	"QUIT")
		echo "Planned exit"
		killall tail
		exit 0
		;;
	*)
		echo "Error: invalid input." >&2
		killall tail
		exit 1
		;;
	esac
done
