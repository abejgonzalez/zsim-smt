################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libconfig1.5/tests/tests.c 

O_SRCS += \
../lib/libconfig1.5/tests/libconfig_tests-tests.o 

OBJS += \
./lib/libconfig1.5/tests/tests.o 

C_DEPS += \
./lib/libconfig1.5/tests/tests.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/tests/%.o: ../lib/libconfig1.5/tests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


