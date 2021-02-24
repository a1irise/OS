#!/bin/bash

echo $$ > .pid
mode="*"
res=1

function usr1 {	mode="+"; }
function usr2 {	mode="*"; }
function sigterm { mode="TERM"; }

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM

while true
do
	case $mode in
	"+")
		res=$((res + 2))
		;;
	"*")
		res=$((res * 2))
		;;
	"TERM")
		echo "Recieved SIGTERM from generator."
		exit 0
		;;
	esac
	sleep 1
	echo $res
done
