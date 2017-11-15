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
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test9
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
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
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test19
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results19.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results19.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test20
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results20.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results20.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test21
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results21.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results21.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test22
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results22.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results22.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test23
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results23.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results23.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test24
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results24.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results24.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test25
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results25.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results25.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test26
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results26.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results26.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test27
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results27.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results27.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test28
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results28.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results28.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test29
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results29.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results29.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test30
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results30.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results30.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test31
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results31.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results31.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test32
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results32.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results32.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test33
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results33.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results33.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test34
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results34.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results34.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test35
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results35.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results35.csv
	fi

done
for ((i=0; i < $1; i++)); do
	echo "/** sample: $i */"
	make test36
	cp log/zsim.log.0 log/trial${i}_t0
	cp log/zsim.log.1 log/trial${i}_t1
	TotalCycle1=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.0 ` 
	TotalCycle2=`awk ' BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $4; } \
		END { print x; }' log/zsim.log.1 ` 
	if [ "$TotalCycle1" -gt "$TotalCycle2" ]
	then
		echo thread1 $TotalCycle2, thread2 $TotalCycle1 >> tests/results36.csv
	fi
	if [ "$TotalCycle2" -gt "$TotalCycle1" ]
	then
		echo thread1 $TotalCycle1, thread2 $TotalCycle2 >> tests/results36.csv
	fi

done
beep
beep
beep

