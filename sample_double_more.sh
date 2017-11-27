#!/bin/bash

rm tests/results*

if [ "$#" -eq 0 ]; then
	echo "usage: $0 [num_samples]"
	exit -1;
fi

for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test1
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
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
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test9
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results9.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results9.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test10
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results10.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results10.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test11
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results11.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results11.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test12
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results12.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results12.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test13
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results13.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results13.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test14
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results14.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results14.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test15
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results15.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results15.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test16
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results16.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results16.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test17
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results17.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results17.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test18
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results18.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results18.csv
	fi

done
beep
beep
beep

