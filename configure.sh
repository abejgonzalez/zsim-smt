#!/bin/bash
set -x
oooe_dir=`pwd`

# extract tarballs
libraries="
pin2.14
libconfig1.5
hdf5
xed
scons2.5"
mkdir -p lib/

for lib in $libraries; do
	if [ ! -d lib/${lib} ] ; then
		tar zxf tar/${lib}.tar.gz -C lib/
	fi
done

# setup pin
export PINPATH=$oooe_dir/lib/pin2.14/

# setup libconfig
lcpath=lib/libconfig1.5
export LIBCONFIGPATH=${oooe_dir}/${lcpath}/install

if [ ! -d $LIBCONFIGPATH ] ; then
	cd $lcpath
	./configure --prefix=$LIBCONFIGPATH && make install
	cd $oooe_dir
fi

# setup scons2.5
sconspath=lib/scons2.5
export SCONSPATH=${oooe_dir}/${sconspath}/install

if [ ! -d $SCONSPATH ] ; then
	cd $sconspath
	python setup.py install --prefix=$SCONSPATH
	cd $oooe_dir
fi


# point ld to hdf5 and elfg0
libhdf5=${oooe_dir}/lib/hdf5
libelfg=${oooe_dir}/lib/elfg0
libxed=${oooe_dir}/lib/xed
export HDF5PATH=${libhdf5}
export XEDPATH=${libxed}

# cleanup
unset lcpath
unset libraries
unset oooe_dir
set +x
