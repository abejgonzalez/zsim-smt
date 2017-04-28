################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/Insmix/insmix.cpp 

OBJS += \
./lib/pin2.14/source/tools/Insmix/insmix.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Insmix/insmix.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Insmix/%.o: ../lib/pin2.14/source/tools/Insmix/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


