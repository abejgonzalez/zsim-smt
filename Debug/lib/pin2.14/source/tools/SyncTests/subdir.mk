################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/SyncTests/lock-tester.cpp \
../lib/pin2.14/source/tools/SyncTests/mt-worker-unix.cpp \
../lib/pin2.14/source/tools/SyncTests/mt-worker-win.cpp \
../lib/pin2.14/source/tools/SyncTests/rt-locks-app.cpp \
../lib/pin2.14/source/tools/SyncTests/rt-locks-tool.cpp \
../lib/pin2.14/source/tools/SyncTests/stress-client-lock-app.cpp \
../lib/pin2.14/source/tools/SyncTests/stress-client-lock-tool.cpp 

OBJS += \
./lib/pin2.14/source/tools/SyncTests/lock-tester.o \
./lib/pin2.14/source/tools/SyncTests/mt-worker-unix.o \
./lib/pin2.14/source/tools/SyncTests/mt-worker-win.o \
./lib/pin2.14/source/tools/SyncTests/rt-locks-app.o \
./lib/pin2.14/source/tools/SyncTests/rt-locks-tool.o \
./lib/pin2.14/source/tools/SyncTests/stress-client-lock-app.o \
./lib/pin2.14/source/tools/SyncTests/stress-client-lock-tool.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/SyncTests/lock-tester.d \
./lib/pin2.14/source/tools/SyncTests/mt-worker-unix.d \
./lib/pin2.14/source/tools/SyncTests/mt-worker-win.d \
./lib/pin2.14/source/tools/SyncTests/rt-locks-app.d \
./lib/pin2.14/source/tools/SyncTests/rt-locks-tool.d \
./lib/pin2.14/source/tools/SyncTests/stress-client-lock-app.d \
./lib/pin2.14/source/tools/SyncTests/stress-client-lock-tool.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/SyncTests/%.o: ../lib/pin2.14/source/tools/SyncTests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


