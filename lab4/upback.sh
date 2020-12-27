#!/bin/bash

[[ $# -ne 0 ]] && { echo "Error: expected 0 arguments"; exit 1; }

dir=$HOME
restore=$dir/restore

[[ ! -d $restore ]] && mkdir $restore
rm -rf $restore/*

backup=$(ls $dir | grep "Backup-" | sort -r | head -n 1)

[[ $backup == "" ]] && { echo "Error: no backup directory"; exit 1; }

for file in $(ls $backup | grep -v "[0-9]{4}-[0-9]{2}-[0-9]{2}$"); do cp -r $backup/$file $restore; done;
