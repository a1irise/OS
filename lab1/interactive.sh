#!/usr/bin/bash

main_menu ()
{
	echo "1. calc"
	echo "2. search"
	echo "3. reverse"
	echo "4. strlen"
	echo "5. log"
	echo "6. help"
	echo "7. exit"
}

calc_menu ()
{
	echo "1. sum"
	echo "2. sub"
	echo "3. mul"
	echo "4. div"
}

interactive ()
{
	while [ 1 ]
	do
		main_menu

		mode=0
		while [[ $mode -lt 1 || $mode -gt 7 ]]
		do
			read -p "Mode: " mode
		done

		case $mode in
			"1")
				calc_menu

				operation=0
				while [[ $operation -lt 1 || $operation -gt 4 ]]
				do
					read -p "Operation: " operation
				done

				read -p "Enter 2 numbers: " num1 num2

				case $operation in
					"1")
						calc sum $num1 $num2
						;;
					"2")
						calc sub $num1 $num2
						;;
					"3")
						calc mul $num1 $num2
						;;
					"4")
						calc div $num1 $num2
						;;
				esac
				;;
			"2")
				read -p "Where to search: " dir
				read -p "What to search for: " pattern
				search $dir $pattern
				;;
			"3")
				read -p "File to reverse: " to_reverse
				read -p "Where to store the result: " destination
				reverse $to_reverse $destination
				;;
			"4")
				read -p "Enter a string (\"example\"): " str
				[[ $str == "\""*"\"" ]] && str=${str:1:-1}
				strlen "$str"
				;;
			"5")
				log
				;;
			"6")
				general_help
				;;
			"7")
				read -p "Exit code: " exit_code
				custom_exit $exit_code
				;;
		esac
	done
}
