################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/Mix/assy-support-ia32.asm \
../lib/pin2.14/source/tools/Mix/assy-support-intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/Mix/marker-example.cpp \
../lib/pin2.14/source/tools/Mix/mix-mt.cpp \
../lib/pin2.14/source/tools/Mix/test-mt.cpp 

OBJS += \
./lib/pin2.14/source/tools/Mix/assy-support-ia32.o \
./lib/pin2.14/source/tools/Mix/assy-support-intel64.o \
./lib/pin2.14/source/tools/Mix/marker-example.o \
./lib/pin2.14/source/tools/Mix/mix-mt.o \
./lib/pin2.14/source/tools/Mix/test-mt.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Mix/marker-example.d \
./lib/pin2.14/source/tools/Mix/mix-mt.d \
./lib/pin2.14/source/tools/Mix/test-mt.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Mix/%.o: ../lib/pin2.14/source/tools/Mix/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Mix/%.o: ../lib/pin2.14/source/tools/Mix/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


