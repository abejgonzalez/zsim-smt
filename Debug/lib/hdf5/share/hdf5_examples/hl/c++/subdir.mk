################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/hdf5/share/hdf5_examples/hl/c++/ptExampleFL.cpp 

OBJS += \
./lib/hdf5/share/hdf5_examples/hl/c++/ptExampleFL.o 

CPP_DEPS += \
./lib/hdf5/share/hdf5_examples/hl/c++/ptExampleFL.d 


# Each subdirectory must supply rules for building sources it contributes
lib/hdf5/share/hdf5_examples/hl/c++/%.o: ../lib/hdf5/share/hdf5_examples/hl/c++/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


