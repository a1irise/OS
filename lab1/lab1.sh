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
		if [[ $# -ne 4 ]]
		then
			echo "Error: invalid number of arguments" 1>&2
			calc_help
			exit 1
		else
			calc $2 $3 $4
		fi
		;;
	"search")
		if [[ $# -ne 3 ]]
		then
			echo "Error: invalid number of arguments" 1>&2
			search_help
			exit 1
		else
			search $2 $3
		fi
		;;
	"reverse")
		if [[ $# -ne 3 ]]
		then
			echo "Error: invalid number of arguments" 1>&2
			reverse_help
			exit 1
		else
			reverse $2 $3
		fi
		;;
	"strlen")
		if [[ $# -ne 2 ]]
		then
			echo "Error: invalid number of arguments" 1>&2
			strlen_help
			exit 1
		else
			strlen "$2"
		fi
		;;
	"log")
		if [[ $# -gt 1 ]]
		then
			echo "Error: expected 0 arguments" 1>&2
			exit 1
		else
			log
		fi
		;;
	"help")
		if [[ $# -gt 1 ]]
		then
			echo "Error: expected 0 arguments" 1>&2
			exit 1
		else
			general_help
		fi
		;;
	"interactive")
		if [[ $# -gt 1 ]]
		then
			echo "Error: expected 0 arguments" 1>&2
			exit 1
		else
			interactive
		fi
		;;
	"exit")
		if [[ $# -gt 2 ]]
		then
			echo "Error: invalid number of arguments" 1>&2
			exit_help
			exit 1
		else
			if [[ $# -eq 1 ]]
			then
				custom_exit
			else
				custom_exit $2
			fi
		fi
		;;
	*)
		echo "Error: invalid command"
		general_help
		exit 1
		;;
esac
