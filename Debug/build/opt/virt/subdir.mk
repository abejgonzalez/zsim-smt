################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../build/opt/virt/cpu.cpp \
../build/opt/virt/fs.cpp \
../build/opt/virt/ports.cpp \
../build/opt/virt/syscall_name.cpp \
../build/opt/virt/time.cpp \
../build/opt/virt/timeout.cpp \
../build/opt/virt/virt.cpp 

OBJS += \
./build/opt/virt/cpu.o \
./build/opt/virt/fs.o \
./build/opt/virt/ports.o \
./build/opt/virt/syscall_name.o \
./build/opt/virt/time.o \
./build/opt/virt/timeout.o \
./build/opt/virt/virt.o 

CPP_DEPS += \
./build/opt/virt/cpu.d \
./build/opt/virt/fs.d \
./build/opt/virt/ports.d \
./build/opt/virt/syscall_name.d \
./build/opt/virt/time.d \
./build/opt/virt/timeout.d \
./build/opt/virt/virt.d 


# Each subdirectory must supply rules for building sources it contributes
build/opt/virt/%.o: ../build/opt/virt/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


