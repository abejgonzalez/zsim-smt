#!/bin/bash
pushd tests/results/
scp `ls *.csv` knock.gq:/var/www/html/csv; 
popd
