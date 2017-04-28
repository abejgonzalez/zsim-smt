################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/pin2.14/source/launcher/launcher_u.c \
../lib/pin2.14/source/launcher/os_specific_a.c \
../lib/pin2.14/source/launcher/os_specific_b.c \
../lib/pin2.14/source/launcher/os_specific_l.c \
../lib/pin2.14/source/launcher/os_specific_m.c \
../lib/pin2.14/source/launcher/os_specific_mic.c \
../lib/pin2.14/source/launcher/utils.c 

OBJS += \
./lib/pin2.14/source/launcher/launcher_u.o \
./lib/pin2.14/source/launcher/os_specific_a.o \
./lib/pin2.14/source/launcher/os_specific_b.o \
./lib/pin2.14/source/launcher/os_specific_l.o \
./lib/pin2.14/source/launcher/os_specific_m.o \
./lib/pin2.14/source/launcher/os_specific_mic.o \
./lib/pin2.14/source/launcher/utils.o 

C_DEPS += \
./lib/pin2.14/source/launcher/launcher_u.d \
./lib/pin2.14/source/launcher/os_specific_a.d \
./lib/pin2.14/source/launcher/os_specific_b.d \
./lib/pin2.14/source/launcher/os_specific_l.d \
./lib/pin2.14/source/launcher/os_specific_m.d \
./lib/pin2.14/source/launcher/os_specific_mic.d \
./lib/pin2.14/source/launcher/utils.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/launcher/%.o: ../lib/pin2.14/source/launcher/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


