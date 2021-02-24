#!/bin/bash

ps aux | awk '$1 == "user" {print $2":"$11}' > temp
cat temp | wc -l | awk '{print $1}' > task1.txt
cat temp >> task1.txt
rm temp





