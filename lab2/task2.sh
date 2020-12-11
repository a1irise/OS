#!/bin/bash

echo "PID" > task2.txt
ps aux | awk '{if ($11 ~ "^/sbin/") print $2}' >> task2.txt
