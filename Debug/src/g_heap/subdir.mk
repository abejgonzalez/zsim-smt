################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/g_heap/dlmalloc.h.c 

OBJS += \
./src/g_heap/dlmalloc.h.o 

C_DEPS += \
./src/g_heap/dlmalloc.h.d 


# Each subdirectory must supply rules for building sources it contributes
src/g_heap/%.o: ../src/g_heap/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


