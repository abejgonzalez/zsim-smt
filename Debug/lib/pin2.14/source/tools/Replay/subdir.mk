################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/Replay/call_function_natively.cpp \
../lib/pin2.14/source/tools/Replay/call_function_natively_app.cpp \
../lib/pin2.14/source/tools/Replay/record_imageload.cpp \
../lib/pin2.14/source/tools/Replay/record_imageload2.cpp \
../lib/pin2.14/source/tools/Replay/replay_syscall.cpp \
../lib/pin2.14/source/tools/Replay/win_replay_exception.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/Replay/win_exception.c 

OBJS += \
./lib/pin2.14/source/tools/Replay/call_function_natively.o \
./lib/pin2.14/source/tools/Replay/call_function_natively_app.o \
./lib/pin2.14/source/tools/Replay/record_imageload.o \
./lib/pin2.14/source/tools/Replay/record_imageload2.o \
./lib/pin2.14/source/tools/Replay/replay_syscall.o \
./lib/pin2.14/source/tools/Replay/win_exception.o \
./lib/pin2.14/source/tools/Replay/win_replay_exception.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Replay/call_function_natively.d \
./lib/pin2.14/source/tools/Replay/call_function_natively_app.d \
./lib/pin2.14/source/tools/Replay/record_imageload.d \
./lib/pin2.14/source/tools/Replay/record_imageload2.d \
./lib/pin2.14/source/tools/Replay/replay_syscall.d \
./lib/pin2.14/source/tools/Replay/win_replay_exception.d 

C_DEPS += \
./lib/pin2.14/source/tools/Replay/win_exception.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Replay/%.o: ../lib/pin2.14/source/tools/Replay/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Replay/%.o: ../lib/pin2.14/source/tools/Replay/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


