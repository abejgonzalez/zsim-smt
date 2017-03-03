#!/bin/bash
set -x
oooe_dir=`pwd`

# extract tarballs
libraries="
pin2.14
libconfig1.5
libelf0.8.13
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

# setup libelf 
lepath=lib/libelf0.8.13
export LIBELFPATH=${oooe_dir}/${lepath}/install

if [ ! -d $LIBELFPATH ] ; then
	cd $lepath
	./configure --prefix=$LIBELFPATH && make install
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
libxed=${oooe_dir}/lib/xed
export HDF5PATH=${libhdf5}
export XEDPATH=${libxed}

# cleanup
unset lepath
unset lcpath
unset libraries
unset oooe_dir
set +x
