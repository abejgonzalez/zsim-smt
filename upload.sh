#!/bin/bash
pushd tests/results/
scp `ls *.csv` ronny@knock.gq:/var/www/html/csv; 
popd
