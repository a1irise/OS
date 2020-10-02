#!/bin/bash

if [[ $# -lt 3 ]]
then
	echo "Missing parameters, unable to execute." >&2
	./help.sh calc
	exit
fi

if [[ ! $2 =~ ^[+-]?[0-9]+$ || ! $3 =~ ^[+-]?[0-9]+$ ]]
then
	echo "Those don't look like integers, try again." >&2
	exit
fi

num1=$2
[[ $num1 =~ ^[+][0-9]+$ ]] && num1=${num1:1}

num2=$3
[[ $num2 =~ ^[+][0-9]+$ ]] && num2=${num2:1}

case $1 in
	"sum")
		echo $(($num1 + $num2))
		;;
	"sub")
		echo $(($num1 - $num2))
		;;
	"mul")
		echo $(($num1 * $num2))
		;;
	"div")
		if [[ $num2 == 0 || ${num2:1} == 0 ]]
		then
			echo "Division by zero." >&2
			exit
		fi

		echo $(($num1 / $num2))
		;;
	*)
		echo "Invalid command, try again." >&2
		./help.sh calc
		exit
		;;
esac
