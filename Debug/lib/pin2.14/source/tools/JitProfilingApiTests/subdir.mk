################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/JitProfilingApiTests/DynamicFuncInstrument.cpp \
../lib/pin2.14/source/tools/JitProfilingApiTests/DynamicInsCount.cpp 

OBJS += \
./lib/pin2.14/source/tools/JitProfilingApiTests/DynamicFuncInstrument.o \
./lib/pin2.14/source/tools/JitProfilingApiTests/DynamicInsCount.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/JitProfilingApiTests/DynamicFuncInstrument.d \
./lib/pin2.14/source/tools/JitProfilingApiTests/DynamicInsCount.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/JitProfilingApiTests/%.o: ../lib/pin2.14/source/tools/JitProfilingApiTests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


