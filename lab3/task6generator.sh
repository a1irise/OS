#!/bin/bash

while true
do
	read line
	case "$line" in
	"+")
		kill -USR1 $(cat .pid)
		;;
	"*")
		kill -USR2 $(cat .pid)
		;;
	"TERM")
		kill -SIGTERM $(cat .pid)
		exit 0
		;;
	"*")
		echo "huh?"
		;;
	esac
done
