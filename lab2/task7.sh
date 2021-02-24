#!/bin/bash

get_bytes()
{
	> $1
	ps aux | awk '{print $2}' > temp

	while read pid
	do
		[[ ! -d /proc/$pid ]] && continue
		read_bytes=$(cat /proc/$pid/io | awk '$1 == "read_bytes:" {print $2}')
		echo "$pid $read_bytes" >> $1
	done < temp

	rm temp
}

get_bytes old
sleep 1m
get_bytes new

> temp

while read line
do
	pid=$(echo $line | awk '{print $1}')
	cmdline=$(cat /proc/$pid/cmdline)
	new_bytes=$(echo $line | awk '{print $2}')
	[[ $new_bytes == "" ]] && continue
	old_bytes=0
	while read line2
	do
		_pid=$(echo $line2 | awk '{print $1}')
		_old_bytes=$(echo $line2 | awk '{print $2}')
		[[ $_pid == $pid && $_old_bytes != "" ]] && old_bytes=$_old_bytes
	done < old
	read_bytes=$(($new_bytes - $old_bytes))
	echo "$pid : $cmdline : $read_bytes" >> temp
done < new

rm old
rm new

cat temp | sort -k3 -nr | head -n 3

rm temp
