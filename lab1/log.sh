#!/bin/bash

log ()
{
	if [[ ! -r "/var/log/anaconda/X.log" ]]
	then
		echo "Error: X.log is not available right now" 1>&2
		exit 1
	fi

	touch temp.txt

	while read line
	do
		[[ $line == "["*"]"*"(II)"* ]] && echo -e ${line//"(II)"/"\e[36mInformation\e[0m"} >> temp.txt
		[[ $line == "["*"]"*"(WW)"* ]] && echo -e ${line//"(WW)"/"\e[33mWarning\e[0m"}
	done < /var/log/anaconda/X.log

	while read line
	do
		echo $line
	done < temp.txt

	rm temp.txt
}
