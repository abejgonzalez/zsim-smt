#!/bin/bash
pushd benchmark/results/
scp `ls *.csv` ronny@knock.gq:/var/www/html/csv; 
popd
