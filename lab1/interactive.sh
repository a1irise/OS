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
	echo "0. home"
}

while [ 1 ]
do
	main_menu
	read -p "What do you want to do?: " mode

	case $mode in
		"1")
			calc_menu
			read -p "What do you want to do?: " operation
			case $operation in
				"1")
					read -p "Enter 2 numbers: " num1 num2
					./calc.sh sum $num1 $num2
					;;
				"2")
					read -p "Enter 2 numbers: " num1 num2
					./calc.sh sub $num1 $num2
					;;
				"3")
					read -p "Enter 2 numbers: " num1 num2
					./calc.sh mul $num1 $num2
					;;
				"4")
					read -p "Enter 2 numbers: " num1 num2
					./calc.sh div $num1 $num2
					;;
				"0")
					continue
					;;
				*)
					echo "That's not one of the options, try again."
					;;
			esac
			;;
		"2")
			read -p "Where do you want to search?: " dir
			read -p "What do you want to search?: " pattern
			./search.sh $dir $pattern
			;;
		"3")
			read -p "Which file do you want to reverse?: " to_reverse
			read -p "Where do you want to store the result?: " destination
			./reverse.sh $to_reverse $destination
			;;
		"4")
			IFS=''
			read -p "Enter a string (without \"  \" unless you want those to count): " str
			./strlen.sh $str
			;;
		"5")
			./log.sh
			;;
		"6")
			./help.sh
			;;
		"7")
			read -p "Do you want to enter the exit code? [y/n]: " answer
			if [[ $answer == "y" ]]
			then
				read -p "What's the exit code?: " exit_code
				./exit.sh exit_code
			else
				./exit.sh
			fi
			break
			;;
		*)
			echo "That's not one of the options, try again."
			continue
			;;
	esac
done
