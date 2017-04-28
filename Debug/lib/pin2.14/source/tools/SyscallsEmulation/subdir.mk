################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/SyscallsEmulation/ppollEmulation_app.cpp \
../lib/pin2.14/source/tools/SyscallsEmulation/syscalls_and_locks_app.cpp \
../lib/pin2.14/source/tools/SyscallsEmulation/syscalls_and_locks_tool.cpp 

OBJS += \
./lib/pin2.14/source/tools/SyscallsEmulation/ppollEmulation_app.o \
./lib/pin2.14/source/tools/SyscallsEmulation/syscalls_and_locks_app.o \
./lib/pin2.14/source/tools/SyscallsEmulation/syscalls_and_locks_tool.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/SyscallsEmulation/ppollEmulation_app.d \
./lib/pin2.14/source/tools/SyscallsEmulation/syscalls_and_locks_app.d \
./lib/pin2.14/source/tools/SyscallsEmulation/syscalls_and_locks_tool.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/SyscallsEmulation/%.o: ../lib/pin2.14/source/tools/SyscallsEmulation/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


