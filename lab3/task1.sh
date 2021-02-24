#!/bin/bash

date=$(date +"%F_%T")
mkdir $HOME/test && { echo "catalog test was created successfully" >> $HOME/report; touch $HOME/test/$date; }
ping www.net_nikogo.ru || echo "$date unable to reach host" >> $HOME/report
