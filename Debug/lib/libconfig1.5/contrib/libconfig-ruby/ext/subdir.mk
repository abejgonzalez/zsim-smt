################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libconfig1.5/contrib/libconfig-ruby/ext/rconfig.c 

OBJS += \
./lib/libconfig1.5/contrib/libconfig-ruby/ext/rconfig.o 

C_DEPS += \
./lib/libconfig1.5/contrib/libconfig-ruby/ext/rconfig.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/contrib/libconfig-ruby/ext/%.o: ../lib/libconfig1.5/contrib/libconfig-ruby/ext/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


