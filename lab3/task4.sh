#!/bin/bash

./task4loop.sh&pid1=$!
./task4loop.sh&pid2=$!
./task4loop.sh&pid3=$!

renice +10 -p $pid1

at now +1 minute <<< "kill $pid3"
at now +2 minutes <<< "pkill task4loop.sh"
