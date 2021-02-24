#!/bin/bash

ps aux | awk '{print $2}' | tail -n +2 > temp
> temp2

while read pid
do
	[[ ! -d /proc/$pid ]] && continue
	ppid=$(cat /proc/$pid/status | awk '$1 == "PPid:" {print $2}')
	sum_exec_runtime=$(cat /proc/$pid/sched | awk '$1 == "se.sum_exec_runtime" {print $3}')
	nr_switches=$(cat /proc/$pid/sched | awk '$1 == "nr_switches" {print $3}')
	art=$(echo "scale=5 ; $sum_exec_runtime / $nr_switches" | bc)
	echo "$pid : $ppid : $art" >> temp2
done < temp

sort -k3 -n temp2 > task4.txt
rm temp
rm temp2
