#!/bin/bash

search ()
{
	if [[ ! -d $1 ]]
	then
		echo "Error: $1 is not a directory" 1>&2
		exit 1
	fi

	if [[ ! -r $1 ]]
	then
		echo "Error: permission denied" 1>&2
		exit 1
	fi

	grep -irn $2 $1 2>/dev/null
}
