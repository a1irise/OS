#!/bin/bash

> report.log

array=()
counter=0

while true
do
	[[ $((counter % 100000)) == 0 ]] && echo ${#array[@]} >> report.log
	array+=(1 2 3 4 5 6 7 8 9 10)
	counter=$((counter + 1))
done
