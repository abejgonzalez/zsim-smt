#!/bin/bash
set -x
oooe_dir=`pwd`

# extract tarballs
libraries="
pin3.2
libconfig1.5
hdf5"
mkdir -p lib/

for lib in $libraries; do
	if [ ! -d lib/${lib} ] ; then
		tar zxf tar/${lib}.tar.gz -C lib/
	fi
done

# setup pin
export PINPATH=$oooe_dir/lib/pin3.2/

# setup libconfig
lcpath=lib/libconfig1.5
export LIBCONFIGPATH=${oooe_dir}/${lcpath}/install

if [ ! -d "lib/libconfig1.5/install" ] ; then
	cd $lcpath
	./configure --prefix=$LIBCONFIGPATH && make install
	cd $oooe_dir
fi

# point ld to hdf5 and elfg0
libhdf5=${oooe_dir}/lib/hdf5
libelfg=${oooe_dir}/lib/elfg0
export HDF5PATH=${libhdf5}

# cleanup
unset lcpath
unset libraries
unset oooe_dir
set +x
