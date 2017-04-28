################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/Cpp11Tests/cpp11Threads.cpp \
../lib/pin2.14/source/tools/Cpp11Tests/cpp11ThreadsApp.cpp 

OBJS += \
./lib/pin2.14/source/tools/Cpp11Tests/cpp11Threads.o \
./lib/pin2.14/source/tools/Cpp11Tests/cpp11ThreadsApp.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Cpp11Tests/cpp11Threads.d \
./lib/pin2.14/source/tools/Cpp11Tests/cpp11ThreadsApp.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Cpp11Tests/%.o: ../lib/pin2.14/source/tools/Cpp11Tests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


