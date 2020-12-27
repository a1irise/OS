#!/bin/bash

[[ $# -ne 1 ]] && { echo "Error: expected 1 argument"; exit 1; }
[[ ! -f $1 ]] && { echo "Error: no such file in current directory"; exit 1; }

trash=$HOME/.trash
trash_log=$HOME/.trash.log
file=$(pwd)/$1

[[ ! -d $trash ]] && mkdir $trash
[[ ! -f $trash_log ]] && touch $trash_log
[[ ! -f $trash/.id ]] && echo 1 > $trash/.id

id=$(cat $trash/.id)

ln $file $trash/$id
echo $file $trash/$id >> $trash_log

echo $((id + 1)) > $trash/.id

rm $file
