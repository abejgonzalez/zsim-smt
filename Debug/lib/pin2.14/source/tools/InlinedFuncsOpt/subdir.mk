################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_ia32.asm \
../lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_intel64.asm \
../lib/pin2.14/source/tools/InlinedFuncsOpt/update_icount_intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_opt.cpp \
../lib/pin2.14/source/tools/InlinedFuncsOpt/inscount_for_lea_opt.cpp 

OBJS += \
./lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_ia32.o \
./lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_intel64.o \
./lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_opt.o \
./lib/pin2.14/source/tools/InlinedFuncsOpt/inscount_for_lea_opt.o \
./lib/pin2.14/source/tools/InlinedFuncsOpt/update_icount_intel64.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/InlinedFuncsOpt/inlined_funcs_opt.d \
./lib/pin2.14/source/tools/InlinedFuncsOpt/inscount_for_lea_opt.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/InlinedFuncsOpt/%.o: ../lib/pin2.14/source/tools/InlinedFuncsOpt/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/InlinedFuncsOpt/%.o: ../lib/pin2.14/source/tools/InlinedFuncsOpt/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


