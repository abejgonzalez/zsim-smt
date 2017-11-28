#!/bin/bash
pushd tests/results/
for i in `ls *.csv`; do 
	j=${i%.csv}_smt.csv; 
	cp $i $j; 
done 

csvs=*_smt.csv;
scp $csvs ronny@knock.gq:/var/www/html/csv; 
rm -rf $csvs
popd
