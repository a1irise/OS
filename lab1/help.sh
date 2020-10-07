#!/bin/bash

calc_help () { echo "- calc [sum|sub|mul|div] [num1] [num2]"; echo "	Just a regular calculator where num1 and num2 are integers."; }
search_help () { echo "- search [path/to/directory] [what_to_search_for]"; echo "	Search any directory (that you have access to) for whatever you want."; }
reverse_help () { echo "- reverse [file_to_reverse] [where_to_save_the_result]"; echo "	Reverses the contence of the first file and save the result to the second file."; }
strlen_help () { echo "- strlen [string]"; echo "	Returns the length of the string."; }
log_help () { echo "- log"; echo "	Returns some warnings and possibly useful information."; }
custom_exit_help () { echo "- exit [exit_code]	//exit_code [0-255]"; echo "	Allows you to quit the program with a custom exit code."; }
help_help () { echo "- help"; echo "	You're already here, but feel free to come back whenever."; }
interactive_help () { echo "- interactive"; echo "	Reduces the amount of typing you have to do."; }
general_help () { echo "In general every command you type should look like this: ./lab1.sh [command] [arguments]"; echo "All supported commands and their respective arguments are presented below"; calc_help; search_help; reverse_help; strlen_help; log_help; custom_exit_help; help_help; interactive_help; }

