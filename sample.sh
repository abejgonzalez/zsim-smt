#!/bin/bash
# collects test samples.
# each round consists of multiple trials.
# (rounds, trials)

# template file argument
if [ "$#" -lt 1 ]; then
	echo "usage: $0 <template>"
	exit -1;
else # parse cmd args
	sample_tpl=$1
fi

# create results dir
RESULTDIR=tests/results
if [ -d "$RESULTDIR" ]; then
	rm -rf $RESULTDIR/*
else
	mkdir -p $RESULTDIR
fi

header="id,reorderBuffer,cacheSize,thread1Cycles,thread2Cycles"
benchmarks=(branch_good branch_miss dcache_good dcache_miss icache_good icache_miss)
rob_sizes=(32,32 40,24 48,16 56,8)
cache_sizes=(8192 16384 32768)
cache_default=32768
id=1 # test id

for benchmark in ${benchmarks[@]}; do
	# write benchmark header
	results_csv=$RESULTDIR/${benchmark}.csv
	echo $header > $results_csv
	
	for rob_size in ${rob_sizes[@]}; do
		for cache_size in ${cache_sizes[@]}; do
 			
			# build sample config
			sample_cfg=$RESULTDIR/sample.cfg
			cp $sample_tpl $sample_cfg

			# populate sample template
			IFS="," read rob1 rob2 <<< "${rob_size}"
			if [ $benchmark == "icache_good" ] || [ $benchmark == "icache_miss" ]; then
				dcache_size=$cache_default
				icache_size=$cache_size
			else
				dcache_size=$cache_size
				icache_size=$cache_default
			fi

			sed -i \
				-e "s/<dcache_size>/$dcache_size/" \
				-e "s/<icache_size>/$icache_size/" \
				-e "s/<t1_command>/benchmark\/$benchmark/" \
				-e "s/<t2_command>/benchmark\/$benchmark/" \
				-e "s/<t1_rob>/$rob1/" \
				-e "s/<t2_rob>/$rob2/" \
				$sample_cfg


			# execute test case
			echo "[+$id] (benchmark, rob_sizes, cache_size): ($benchmark, ($rob1, $rob2), $cache_size)"
			make -j2 test TEST=$sample_cfg && beep

			# parse and write SMT cycle counts
			cp log/zsim.log.0 log/${id}_t0
			cp log/zsim.log.1 log/${id}_t1
			t1_cycles=`awk 'BEGIN { x = 0 } $3 ~ /CurCycle/ { x = $4; } END { print x; }' log/zsim.log.0` 
			t2_cycles=`awk 'BEGIN { x = 0 } $3 ~ /CurCycle/ { x = $4; } END { print x; }' log/zsim.log.1` 
			echo "$id,$rob1,$cache_size,$t1_cycles,$t2_cycles" >> $results_csv
			let id+=1
		done
	done
done

