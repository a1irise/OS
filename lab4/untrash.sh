#!/bin/bash

[[ $# -ne 1 ]] && { echo "Error: expected 1 argument"; exit 1; }

trash=$HOME/.trash
trash_log=$HOME/.trash.log

[[ ! -d $trash || ! -f $trash_log || $(grep "/$1" $trash_log) == "" ]] && { echo "Error: no such file"; exit 1; }

while read line
do
	full_path=$(echo $line | awk '{print $1}')

	answer=""
	while [[ $answer != "n" && $answer != "y" ]]; do read -p "Restore $full_path (y/n)? " answer <&1; done;
	[[ $answer == "n" ]] && continue

	dir=$(echo $full_path | awk -F "/$1" '{print $1}')
	name=$(echo $full_path | awk -F "$dir/" '{print $2}')
	ref=$(echo $line | awk '{print $2}')

	[[ ! -d $dir ]] && { echo "$dir doesn't exist anymore, file will be restored to home directory"; dir=$HOME; }
	[[ -f $dir/$name ]] && read -p "File with that name already exists. Choose another name: " name

	ln $ref $dir/$name
	rm $ref
done < <(grep "/$1" $trash_log)







