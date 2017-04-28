################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/AlignChk/movdqa_test_ia32.asm \
../lib/pin2.14/source/tools/AlignChk/movdqa_test_intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/AlignChk/alignchk.cpp \
../lib/pin2.14/source/tools/AlignChk/movdqa_test2.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/AlignChk/misaligned.c 

OBJS += \
./lib/pin2.14/source/tools/AlignChk/alignchk.o \
./lib/pin2.14/source/tools/AlignChk/misaligned.o \
./lib/pin2.14/source/tools/AlignChk/movdqa_test2.o \
./lib/pin2.14/source/tools/AlignChk/movdqa_test_ia32.o \
./lib/pin2.14/source/tools/AlignChk/movdqa_test_intel64.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/AlignChk/alignchk.d \
./lib/pin2.14/source/tools/AlignChk/movdqa_test2.d 

C_DEPS += \
./lib/pin2.14/source/tools/AlignChk/misaligned.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/AlignChk/%.o: ../lib/pin2.14/source/tools/AlignChk/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/AlignChk/%.o: ../lib/pin2.14/source/tools/AlignChk/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/AlignChk/%.o: ../lib/pin2.14/source/tools/AlignChk/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


