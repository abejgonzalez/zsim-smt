#!/bin/bash
# collects test samples.
# each round consists of multiple trials.
# (rounds, trials)

# template file argument
if [ "$#" -lt 2 ]; then
	echo "usage: $0 <template> <mode>"
	exit -1;
else # parse cmd args
	sample_tpl=$1
	sample_mode=$2
fi

# create results dir
RESULTDIR=tests/results
if [ -d "$RESULTDIR" ]; then
	rm -rf $RESULTDIR/*
else
	mkdir -p $RESULTDIR
fi

# test parameters (SMT, OOO)
if [ "$sample_mode" == "smt" ]; then
	header="id,reorderBuffer,cacheSize,thread1Cycles,thread2Cycles"
    benchmarks=(branch_good branch_miss dcache_good dcache_miss icache_good icache_miss)
    rob_sizes=(32,32 40,24 48,16 56,8)
    cache_sizes=(8192 16384 32768)
#   benchmarks=(dcache_good)
# 	rob_sizes=(32,32 56,8)
# 	cache_sizes=(32768)
	cache_default=32768
	id=1 # test id
elif [ "$sample_mode" == "ooo" ]; then
	header="id,reorderBuffer,cacheSize,oooCycles"
    benchmarks=(branch_good branch_miss dcache_good dcache_miss icache_good icache_miss)
    rob_sizes=(8 16 24 32 40 48 56)
    cache_sizes=(8192 16384 32768)
# 	benchmarks=(dcache_good)
# 	rob_sizes=(8 32 56)
# 	cache_sizes=(32768)
	cache_default=32768
	id=1 # test id
fi

function sample_smt {
	IFS="," read rob1 rob2 <<< "${rob_size}"	
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
	cp log/zsim.log.0 log/smt${id}_t0
	cp log/zsim.log.1 log/smt${id}_t1
    t1_cycles=`awk 'BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } END { print x; }' log/zsim.log.0` 
	t2_cycles=`awk 'BEGIN { x = 0 } $3 ~ /TotalCycle/ { x = $5; } END { print x; }' log/zsim.log.1` 
    # t1_cycles=`awk 'BEGIN { x = 0 } $3 ~ /CurCycle/ { x = $4; } END { print x; }' log/zsim.log.0` 
    # t2_cycles=`awk 'BEGIN { x = 0 } $3 ~ /CurCycle/ { x = $4; } END { print x; }' log/zsim.log.1` 
	echo "$id,$rob1,$cache_size,$t1_cycles,$t2_cycles" >> $results_csv
	let id+=1
}

function sample_ooo {
	sed -i \
		-e "s/<dcache_size>/$dcache_size/" \
		-e "s/<icache_size>/$icache_size/" \
		-e "s/<command>/benchmark\/$benchmark/" \
		$sample_cfg

	sed -i \
		-e "s/ReorderBuffer<[0-9]*, 4> rob/ReorderBuffer<$rob_size, 4> rob/" \
		"src/ooo_core.h"

	# execute test case
	make -j2 # recompile ooo core.
	echo "[+$id] (benchmark, rob_size, cache_size): ($benchmark, ($rob_size), $cache_size)"
	make -j2 test TEST=$sample_cfg && beep

	# parse and write SMT cycle counts
	cp log/zsim.log.0 log/ooo${id}_t0
	ooo_cycles=`awk 'BEGIN { x = 0 } $5 ~ /curCycle/ { x = $6; } END { print x; }' log/zsim.log.0` 
	echo "$id,$rob_size,$cache_size,$ooo_cycles" >> $results_csv
	let id+=1
}


for benchmark in ${benchmarks[@]}; do
	# write benchmark header
	results_csv=$RESULTDIR/${benchmark}_${sample_mode}.csv
	echo $header > $results_csv
	
	for rob_size in ${rob_sizes[@]}; do
		for cache_size in ${cache_sizes[@]}; do
 			
			# build sample config
			sample_cfg=$RESULTDIR/sample.cfg
			cp $sample_tpl $sample_cfg

			# populate sample template
			if [ $benchmark == "icache_good" ] || [ $benchmark == "icache_miss" ]; then
				dcache_size=$cache_default
				icache_size=$cache_size
			else
				dcache_size=$cache_size
				icache_size=$cache_default
			fi

			# kick off sampler
			if [ "$sample_mode" == "smt" ]; then
				sample_smt 
			elif [ "$sample_mode" == "ooo" ]; then
				sample_ooo
			fi

		done
	done
done

