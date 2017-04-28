################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../misc/hooks/test.cpp \
../misc/hooks/zsim_jni.cpp 

C_SRCS += \
../misc/hooks/fortran_hooks.c \
../misc/hooks/test.c 

OBJS += \
./misc/hooks/fortran_hooks.o \
./misc/hooks/test.o \
./misc/hooks/zsim_jni.o 

CPP_DEPS += \
./misc/hooks/test.d \
./misc/hooks/zsim_jni.d 

C_DEPS += \
./misc/hooks/fortran_hooks.d \
./misc/hooks/test.d 


# Each subdirectory must supply rules for building sources it contributes
misc/hooks/%.o: ../misc/hooks/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

misc/hooks/%.o: ../misc/hooks/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


