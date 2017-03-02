#!/bin/bash
set -x
# extract tarballs
mkdir lib/pin3.2
tar xf lib/pin3.2.tar.gz -C lib/pin3.2

# set the pinpath
oooe_dir=`pwd`
export PINPATH=$oooe_dir/lib/pin3.2/
unset oooe_dir
set +x
