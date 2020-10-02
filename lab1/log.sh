#!/bin/bash

[[ ! -r "~/var/log/anaconda/X.log" ]] && echo "X.log is not available rigth now." >&2

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
