#!/bin/bash

> task5.txt

./task4.sh
cat task4.txt | awk '{print $3}' | uniq > temp

while read uniq_ppid
do
	sum_art=0
	count=0

	while read line
	do
		pid=$(echo $line | awk '{print $1}')
		ppid=$(echo $line | awk '{print $3}')
		art=$(echo $line | awk '{print $5}')

		[[ $ppid -lt $uniq_ppid ]] && continue
		[[ $ppid -gt $uniq_ppid ]] && break
		if [[ $ppid -eq $uniq_ppid ]]
		then
			sum_art=$(echo "scale=5 ; $sum_art + $art" | bc)
			count=$((count+1))
			echo $line >> task5.txt
		fi
	done < task4.txt

	avg_art=$(echo "scale=5 ; $sum_art / $count" | bc)
	echo "Average_Sleeping_Children_of_ParentID=$ppid_ is $avg_art" >> task5.txt
done < temp

rm temp
