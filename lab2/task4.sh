#!/bin/bash

ps aux | awk '{print $2}' | tail -n +2 > temp

while read pid
do
	[[ ! -d /proc/$pid ]] && continue
	ppid=$(awk '$1 == "PPid:" {print $2}' /proc/$pid/status)
	sum_exec_runtime=$(awk '$1 == "se.sum_exec_runtime" {print $3}' /proc/$pid/sched)
	nr_switches=$(awk '$1 == "nr_switches" {print $3}' /proc/$pid/sched)
	art=$(echo "scale=5 ; $sum_exec_runtime / $nr_switches" | bc)
	echo "$pid : $ppid : $art" >> temp2
done < temp

sort -k3 -n temp2 > task4.txt
rm temp
rm temp2
