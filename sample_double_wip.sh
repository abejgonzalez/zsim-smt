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
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test1
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results1.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results1.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test2
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results2.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results2.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test3
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results3.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results3.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test4
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results4.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results4.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test5
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results5.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results5.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test6
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results6.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results6.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test7
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results7.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results7.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test8
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	curCycle1=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.0 ` 
	curCycle2=`awk ' BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$curCycle1" -gt "$curCycle2" ]
	then
		echo thread1 $curCycle2, thread2 $curCycle1 >> tests./results8.csv
	fi
	if [ "$curCycle2" -gt "$curCycle1" ]
	then
		echo thread1 $curCycle1, thread2 $curCycle2 >> tests/results8.csv
	fi

done
beep
beep
beep

