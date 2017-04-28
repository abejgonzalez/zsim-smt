################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libelf0.8.13/po/gmo2msg.c 

OBJS += \
./lib/libelf0.8.13/po/gmo2msg.o 

C_DEPS += \
./lib/libelf0.8.13/po/gmo2msg.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libelf0.8.13/po/%.o: ../lib/libelf0.8.13/po/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


