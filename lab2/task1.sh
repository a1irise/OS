#!/bin/bash

ps aux | awk '{if ($1 ~ "^user") print $2 ":" $11}' > temp.txt

wc -l temp.txt | awk '{print $1}' > task1.txt
echo "PID:COMMAND" >> task1.txt
cat temp.txt >> task1.txt

rm -f temp.txt





