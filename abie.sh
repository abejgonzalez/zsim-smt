#!/bin/bash

make
make test-clean
make test -j2
cp tests/config/smt.cfg tests/config/smt_temp.cfg
cp tests/config/smt_1.cfg tests/config/smt.cfg
cp log/zsim.log.0 smt.fun
make test-clean
make test -j2
cp tests/config/smt_temp.cfg tests/config/smt.cfg
cp log/zsim.log.0 ooo.fun
