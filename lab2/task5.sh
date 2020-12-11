#!/bin/bash

echo "PID : PPID : ART" > task5.txt

for unique_ppid in $(awk '{print $3}' task4.txt | uniq)
do
	[[ $unique_ppid == "PPID" ]] && continue

	sum_art=0
	counter=0

	while read line
	do
		ppid=$(echo $line | awk '{print $3}')

		[[ $ppid -lt $unique_ppid || $ppid == "PPID" ]] && continue

		[[ $ppid -gt $unique_ppid ]] && break

		if [[ $ppid -eq $unique_ppid ]]
		then
			pid=$(echo $line | awk '{print $1}')
			art=$(echo $line | awk '{print $5}')
			counter=$((counter + 1))
			sum_art=$(echo "scale=5 ; $sum_art + $art" | bc)
			echo "$pid : $ppid : $art" >> task5.txt
		fi
	done < task4.txt

	avg_art=$(echo "scale=5 ; $sum_art / $counter" | bc)
	echo "Average_Sleeping_Children_of_ParentID=$unique_ppid is $avg_art" >> task5.txt
done
