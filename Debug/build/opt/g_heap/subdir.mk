################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../build/opt/g_heap/dlmalloc.h.c 

OBJS += \
./build/opt/g_heap/dlmalloc.h.o 

C_DEPS += \
./build/opt/g_heap/dlmalloc.h.d 


# Each subdirectory must supply rules for building sources it contributes
build/opt/g_heap/%.o: ../build/opt/g_heap/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


