#!/bin/bash

[[ $# != 1 ]] && { echo "Error: invalid number of arguments."; exit 1; }

trash=$HOME/.trash
log=$HOME/.trash.log

> temp
grep "/$1" $log >> temp

while read line
do
	file=$(echo $line | awk '{print $1}')

	answer=""
	while [[ $answer != "y" && $answer != "n" ]]
	do
		read -p "Restore $file [y/n]? " answer
	done
	[[ $answer == "n" ]] && continue

	dir=(echo $line | awk -F "/$1" '{print $1}')
	name=(echo $line | awk -F "$dir/" '{print $2}')
	ref=$(echo $line | awk '{print $2}')

	[[ ! -d $dir ]] && { echo "$dir doesn't exist anymore, file will be restored to $HOME"; dir=$HOME; }
	[[ -f $dir/$name ]] && read -p "$dir/$name already exists, choose another name: " name

	ln $ref $dir/$name
	rm $ref
done < temp

rm temp


