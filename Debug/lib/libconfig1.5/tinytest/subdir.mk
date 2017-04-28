################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libconfig1.5/tinytest/tinytest.c 

O_SRCS += \
../lib/libconfig1.5/tinytest/tinytest.o 

OBJS += \
./lib/libconfig1.5/tinytest/tinytest.o 

C_DEPS += \
./lib/libconfig1.5/tinytest/tinytest.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/tinytest/%.o: ../lib/libconfig1.5/tinytest/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


