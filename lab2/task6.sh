#!/bin/bash

> temp
ps aux | awk '{print $2}' >> temp

max=0
max_pid=0

while read pid
do
	[[ ! -d /proc/$pid ]] && continue
	mem=$(cat /proc/$pid/status | awk '$1 == "VmSize:" {print $2}')
	[[ $mem -gt $max ]] && { max=$mem; max_pid=$pid; }
done < temp

echo $max_pid
rm temp
