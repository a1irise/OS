#!/bin/bash

(tail -f pipe) | while true
do
	read $line
	echo $line
done
