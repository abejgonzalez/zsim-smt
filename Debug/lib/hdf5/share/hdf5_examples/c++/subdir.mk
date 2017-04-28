################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/hdf5/share/hdf5_examples/c++/chunks.cpp \
../lib/hdf5/share/hdf5_examples/c++/compound.cpp \
../lib/hdf5/share/hdf5_examples/c++/create.cpp \
../lib/hdf5/share/hdf5_examples/c++/extend_ds.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5group.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_cmprss.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_crtatt.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_crtdat.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrp.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrpar.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrpd.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_extend.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_rdwt.cpp \
../lib/hdf5/share/hdf5_examples/c++/h5tutr_subset.cpp \
../lib/hdf5/share/hdf5_examples/c++/readdata.cpp \
../lib/hdf5/share/hdf5_examples/c++/writedata.cpp 

OBJS += \
./lib/hdf5/share/hdf5_examples/c++/chunks.o \
./lib/hdf5/share/hdf5_examples/c++/compound.o \
./lib/hdf5/share/hdf5_examples/c++/create.o \
./lib/hdf5/share/hdf5_examples/c++/extend_ds.o \
./lib/hdf5/share/hdf5_examples/c++/h5group.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_cmprss.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtatt.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtdat.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrp.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrpar.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrpd.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_extend.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_rdwt.o \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_subset.o \
./lib/hdf5/share/hdf5_examples/c++/readdata.o \
./lib/hdf5/share/hdf5_examples/c++/writedata.o 

CPP_DEPS += \
./lib/hdf5/share/hdf5_examples/c++/chunks.d \
./lib/hdf5/share/hdf5_examples/c++/compound.d \
./lib/hdf5/share/hdf5_examples/c++/create.d \
./lib/hdf5/share/hdf5_examples/c++/extend_ds.d \
./lib/hdf5/share/hdf5_examples/c++/h5group.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_cmprss.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtatt.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtdat.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrp.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrpar.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_crtgrpd.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_extend.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_rdwt.d \
./lib/hdf5/share/hdf5_examples/c++/h5tutr_subset.d \
./lib/hdf5/share/hdf5_examples/c++/readdata.d \
./lib/hdf5/share/hdf5_examples/c++/writedata.d 


# Each subdirectory must supply rules for building sources it contributes
lib/hdf5/share/hdf5_examples/c++/%.o: ../lib/hdf5/share/hdf5_examples/c++/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


