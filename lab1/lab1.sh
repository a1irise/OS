#!/bin/bash

case $1 in
	"calc")
		./calc.sh $2 $3 $4
		;;
	"search")
		./search.sh $2 $3
		;;
	"reverse")
		./reverse.sh $2 $3
		;;
	"strlen")
		[[ $# -lt 2 ]] && ./strlen.sh || ./strlen.sh "$2"
		;;
	"log")
		./log.sh
		;;
	"help")
		./help.sh
		;;
	"interactive")
		./interactive.sh
		;;
	"exit")
		./exit.sh $2
		;;
	*)
		echo "Sorry that command doesn't exist, but these ones do, try one of them."
		./help.sh
		;;
esac
