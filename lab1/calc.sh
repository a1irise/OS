#!/bin/bash

if [[ $# -ne 3 ]]
then
	echo "Error: invalid number of arguments" 1>&2
	./help.sh calc
	exit 1
fi

if [[ ! $2 =~ ^[+-]?[0-9]+$ || ! $3 =~ ^[+-]?[0-9]+$ ]]
then
	echo "Error: expected two integers" 1>&2
	exit 1
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
			echo "Error: division by zero" 1>&2
			exit 1
		fi
		echo $(($num1 / $num2))
		;;
	*)
		echo "Error: invalid command" 1>&2
		./help.sh calc
		exit 1
		;;
esac
