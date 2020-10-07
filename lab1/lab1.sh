#!/bin/bash

source calc.sh
source search.sh
source reverse.sh
source strlen.sh
source log.sh
source exit.sh
source help.sh
source interactive.sh

case $1 in
	"calc")
		calc $2 $3 $4
		;;
	"search")
		search $2 $3
		;;
	"reverse")
		reverse $2 $3
		;;
	"strlen")
		[[ $# -lt 2 ]] && strlen || strlen "$2"
		;;
	"log")
		log
		;;
	"help")
		general_help
		;;
	"interactive")
		interactive
		;;
	"exit")
		custom_exit $2
		;;
	*)
		echo "Sorry that command doesn't exist, but these ones do, try one of them."
		general_help
		;;
esac
