#!/bin/bash

max_ram=-1
max_pid=-1

for pid in $(ps aux | awk '{print $2}')
do
	dir=/proc/$pid

	if [[ -d $dir ]]
	then
		ram=$(awk '{if ($1 == "VmSize:") print $2}' $dir/status)
		if [[ $ram -gt $max_ram ]]
		then
			max_ram=$ram
			max_pid=$pid
		fi
	fi
done

echo $max_pid
