#!/bin/bash

calc () { echo "- calc [sum|sub|mul|div] [num1] [num2]"; echo "	Just your regular calculator where num1 and num2 are integers."; }
search () { echo "- search [path/to/directory] [what_to_search_for]"; echo "	Search any directory (that you have access to) for whatever you want."; }
reverse () { echo "- reverse [file_to_reverse] [where_to_save_the_result]"; echo "	Reverses the contence of the first file and save the result to the second file."; }
strlen () { echo "- strlen [string]"; echo "	Returns the length of the string."; }
log () { echo "- log"; echo "	Returns some warnings and possibly useful information."; }
custom_exit () { echo "- exit [exit_code]	//exit_code [0-255]"; echo "	Allows you to quit the program with a custom exit code."; }
interactive () { echo "- interactive"; echo "	Reduces the amount of typing you have to do."; }
help () { echo "- help"; echo "	You're already here, but feel free to come back whenever."; }

case $1 in
	"calc")
		calc
		;;
	"search")
		search
		;;
	"reverse")
		reverse
		;;
	"strlen")
		strlen
		;;
	"log")
		log
		;;
	"custom_exit")
		custom_exit
		;;
	"interactive")
		interactive
		;;
	"help")
		help
		;;
	*)
		echo "In general every command you type should look like this: ./lab1.sh [command] [arguments]"
		echo "All supported commands and their respective arguments are presented below"
		calc
		search
		reverse
		strlen
		log
		custom_exit
		interactive
		help
		;;
esac
