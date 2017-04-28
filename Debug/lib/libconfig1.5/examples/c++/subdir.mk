################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/libconfig1.5/examples/c++/example1.cpp \
../lib/libconfig1.5/examples/c++/example2.cpp \
../lib/libconfig1.5/examples/c++/example3.cpp \
../lib/libconfig1.5/examples/c++/example4.cpp 

O_SRCS += \
../lib/libconfig1.5/examples/c++/example1.o \
../lib/libconfig1.5/examples/c++/example2.o \
../lib/libconfig1.5/examples/c++/example3.o \
../lib/libconfig1.5/examples/c++/example4.o 

OBJS += \
./lib/libconfig1.5/examples/c++/example1.o \
./lib/libconfig1.5/examples/c++/example2.o \
./lib/libconfig1.5/examples/c++/example3.o \
./lib/libconfig1.5/examples/c++/example4.o 

CPP_DEPS += \
./lib/libconfig1.5/examples/c++/example1.d \
./lib/libconfig1.5/examples/c++/example2.d \
./lib/libconfig1.5/examples/c++/example3.d \
./lib/libconfig1.5/examples/c++/example4.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/examples/c++/%.o: ../lib/libconfig1.5/examples/c++/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


