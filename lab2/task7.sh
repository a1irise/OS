#!/bin/bash

for pid in $(ps aux | awk '{print $2}')
do
	dir=/proc/$pid

	if [[ -d $dir && -r $dir/io ]]
	then
		read_bytes=$(awk '{if ($1 == "read_bytes:") print $2}' $dir/io)
		echo "$pid $read_bytes"
	fi
done > temp.txt

sleep 1m

echo "PID : CMDLINE : READ_BYTES"

for pid in $(ps aux | awk '{print $2}')
do
	dir=/proc/$pid

	if [[ -d $dir && -r $dir/io ]]
	then
		initial_read_bytes=$(awk '{if ($1 == $pid) print $2}' temp.txt)
		updated_read_bytes=$(awk '{if ($1 == "read_bytes:") print $2}' $dir/io)
		read_bytes=0
		[[ ! -n $initial_read_bytes ]] && read_bytes=$updated_read_bytes || read_bytes=$(($updated_read_bytes - $initial_read_bytes))
		command=$(cat $dir/cmdline | tr '\0' '\n')
		echo "$pid : $command : $read_bytes"
	fi
done | sort -nr -k5 | head -n 3

rm -f temp.txt
