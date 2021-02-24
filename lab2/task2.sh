#!/bin/bash

> task2.txt
ps aux | awk '$11 ~ /^\/sbin\// {print $2}' >> task2.txt
