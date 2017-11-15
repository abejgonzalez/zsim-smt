#!/bin/bash

rm tests/results*

if [ "$#" -eq 0 ]; then
	echo "usage: $0 [num_samples]"
	exit -1;
fi

for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test1
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results1.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results1.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test2
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results2.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results2.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test3
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results3.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results3.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test4
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results4.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results4.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test5
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results5.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results5.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test6
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results6.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results6.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test7
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results7.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results7.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test8
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results8.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results8.csv
	fi

done
beep
beep
beep

