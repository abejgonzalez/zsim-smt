################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/SegTrace/segtrace.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/SegTrace/hello.c \
../lib/pin2.14/source/tools/SegTrace/thread.c 

OBJS += \
./lib/pin2.14/source/tools/SegTrace/hello.o \
./lib/pin2.14/source/tools/SegTrace/segtrace.o \
./lib/pin2.14/source/tools/SegTrace/thread.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/SegTrace/segtrace.d 

C_DEPS += \
./lib/pin2.14/source/tools/SegTrace/hello.d \
./lib/pin2.14/source/tools/SegTrace/thread.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/SegTrace/%.o: ../lib/pin2.14/source/tools/SegTrace/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/SegTrace/%.o: ../lib/pin2.14/source/tools/SegTrace/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


