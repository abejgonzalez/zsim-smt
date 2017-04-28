################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/RtnTests/ifuncInstrumentation.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/RtnTests/ifuncInstrumentationApp.c 

OBJS += \
./lib/pin2.14/source/tools/RtnTests/ifuncInstrumentation.o \
./lib/pin2.14/source/tools/RtnTests/ifuncInstrumentationApp.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/RtnTests/ifuncInstrumentation.d 

C_DEPS += \
./lib/pin2.14/source/tools/RtnTests/ifuncInstrumentationApp.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/RtnTests/%.o: ../lib/pin2.14/source/tools/RtnTests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/RtnTests/%.o: ../lib/pin2.14/source/tools/RtnTests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


