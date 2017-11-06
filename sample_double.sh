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
done
beep
beep
beep

