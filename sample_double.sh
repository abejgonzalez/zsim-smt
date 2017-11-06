#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "usage: $0 [num_samples]"
	exit -1;
fi

for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests.results.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results.csv
	fi

done
beep
beep
beep

