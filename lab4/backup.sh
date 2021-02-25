#!/bin/bash

[[ $# != 1 ]] && { echo "Error: expected 1 argument."; exit 1; }

dir=$HOME
source=$dir/$1
backup_report=$dir/backup-report

[[ ! -d $source ]] && { echo "Error: $source is not a directory."; exit 1; }
[[ ! -f $backup_report ]] && touch $backup_report

date=$(date +"%Y-%m-%d")
backup=Backup-$date

prev_backup=$(ls $dir | grep "Backup-" | sort -r | head -n 1)
prev_date=$(echo $prev_backup | awk -F "Backup-" '{print $2}')

date_diff=$(( $(date -d $date +%s) - $(date -d $prev_date +%s) / (60*60*24))
if [[ $date_diff -gt 7 || $prev_backup == "" ]]
then
	mkdir $backup
	echo "New backup directory $backup created on $date" >> $backup_report
	for file in $(ls $source)
	do
		cp $source/$file $backup
		echo $file >> $backup_report
	done
else
	> new_files
	> modified_files
	new_flag=0
	modified_flag=0
	for file in $(ls $source)
	do
		if [[ ! -f $prev_backup/$file ]]
		then
			cp $source/$file $prev_backup
			echo $file >> new_files
			bew_flag=1
		else
			old_size=$(wc -c $prev_back/$file | awk '{print $1}')
			new_size=$(wc -c $source/$file | awk '{print $1}')
			if [[ $old_size -ne $new_size ]]
			then
				mv $prev_backup/$file $prev_backup/$file.$date
				cp $source/$file $prev_backup
				echo "$file $file.$date" >> modified_files
				modified_flag=1
			fi
		fi
	done

	[[ $new_flag -eq 1 || $modified_flag -eq 1 ]] && acho "Directory $prev_backup has been modified on $date" > $backup_report
	[[ $new_flag -eq 1 ]] && { echo "Added: " >> $backup_report; cat new_files >> $backup_report; }
	[[ $modified_flag -eq 1 ]] && { echo "Modified: " >> $backup_report; cat modified_files >> $backup_report; }

	rm new_files
	rm modified_files
fi



















