################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/Maid/CallStack.cpp \
../lib/pin2.14/source/tools/Maid/Maid.cpp \
../lib/pin2.14/source/tools/Maid/argv_readparam.cpp \
../lib/pin2.14/source/tools/Maid/syscall_names.cpp 

OBJS += \
./lib/pin2.14/source/tools/Maid/CallStack.o \
./lib/pin2.14/source/tools/Maid/Maid.o \
./lib/pin2.14/source/tools/Maid/argv_readparam.o \
./lib/pin2.14/source/tools/Maid/syscall_names.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Maid/CallStack.d \
./lib/pin2.14/source/tools/Maid/Maid.d \
./lib/pin2.14/source/tools/Maid/argv_readparam.d \
./lib/pin2.14/source/tools/Maid/syscall_names.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Maid/%.o: ../lib/pin2.14/source/tools/Maid/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


