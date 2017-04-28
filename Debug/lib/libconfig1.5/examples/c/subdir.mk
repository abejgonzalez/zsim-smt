################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libconfig1.5/examples/c/example1.c \
../lib/libconfig1.5/examples/c/example2.c \
../lib/libconfig1.5/examples/c/example3.c 

O_SRCS += \
../lib/libconfig1.5/examples/c/example1.o \
../lib/libconfig1.5/examples/c/example2.o \
../lib/libconfig1.5/examples/c/example3.o 

OBJS += \
./lib/libconfig1.5/examples/c/example1.o \
./lib/libconfig1.5/examples/c/example2.o \
./lib/libconfig1.5/examples/c/example3.o 

C_DEPS += \
./lib/libconfig1.5/examples/c/example1.d \
./lib/libconfig1.5/examples/c/example2.d \
./lib/libconfig1.5/examples/c/example3.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/examples/c/%.o: ../lib/libconfig1.5/examples/c/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


