################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/virt/cpu.cpp \
../src/virt/fs.cpp \
../src/virt/ports.cpp \
../src/virt/time.cpp \
../src/virt/timeout.cpp \
../src/virt/virt.cpp 

OBJS += \
./src/virt/cpu.o \
./src/virt/fs.o \
./src/virt/ports.o \
./src/virt/time.o \
./src/virt/timeout.o \
./src/virt/virt.o 

CPP_DEPS += \
./src/virt/cpu.d \
./src/virt/fs.d \
./src/virt/ports.d \
./src/virt/time.d \
./src/virt/timeout.d \
./src/virt/virt.d 


# Each subdirectory must supply rules for building sources it contributes
src/virt/%.o: ../src/virt/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


