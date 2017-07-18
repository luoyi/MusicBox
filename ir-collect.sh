#!/bin/bash

F=/tmp/ir-num

echo -n ''>$F

while sleep 1; do
	NUM=$(cat $F)
	echo $NUM
	if [ 1$NUM -gt 10 ]; then
		sleep 5
		NUM=$(cat $F)
		echo -n '' >$F
		echo "read $NUM"
	fi
done

