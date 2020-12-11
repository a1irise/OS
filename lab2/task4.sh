#!/bin/bash

echo "PID : PPID : ART" > task4.txt

for pid in $(ps aux | awk '{print $2}')
do
	dir=/proc/$pid

	if [[ -d $dir ]]
	then
		ppid=$(awk '{if ($1 == "PPid:") print $2}' $dir/status)
		sum_exec_runtime=$(awk '{if ($1 == "se.sum_exec_runtime") print $3}' $dir/sched)
		nr_switches=$(awk '{if ($1 == "nr_switches") print $3}' $dir/sched)
		art=$(echo "scale=5 ; $sum_exec_runtime / $nr_switches" | bc)
		echo "$pid : $ppid : $art"
	fi
done | sort -n -k3 >> task4.txt
