#!/bin/bash
set -x
# extract tarballs
libraries="
pin3.2.tar.gz
libconfig1.5.tar.gz"
mkdir -p lib/

for lib in $libraries; do
	tar zxf tar/$lib -C lib/
done

# set the pinpath
oooe_dir=`pwd`
export PINPATH=$oooe_dir/lib/pin3.2/
unset oooe_dir
set +x
