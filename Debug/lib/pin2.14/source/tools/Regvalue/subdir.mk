################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/Regvalue/changeRegs_ia32.asm \
../lib/pin2.14/source/tools/Regvalue/changeRegs_intel64.asm \
../lib/pin2.14/source/tools/Regvalue/doXsave_ia32.asm \
../lib/pin2.14/source/tools/Regvalue/doXsave_intel64.asm \
../lib/pin2.14/source/tools/Regvalue/print_flags_asm.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/Regvalue/change_context_regvalue.cpp \
../lib/pin2.14/source/tools/Regvalue/checkXStateBV_app.cpp \
../lib/pin2.14/source/tools/Regvalue/checkXStateBV_tool.cpp \
../lib/pin2.14/source/tools/Regvalue/context_regvalue.cpp \
../lib/pin2.14/source/tools/Regvalue/context_utils.cpp \
../lib/pin2.14/source/tools/Regvalue/emu_context_regvalue.cpp \
../lib/pin2.14/source/tools/Regvalue/iarg_reg_reference.cpp \
../lib/pin2.14/source/tools/Regvalue/iarg_reg_reference_flags.cpp \
../lib/pin2.14/source/tools/Regvalue/register_modification_utils.cpp \
../lib/pin2.14/source/tools/Regvalue/regvalue_app.cpp \
../lib/pin2.14/source/tools/Regvalue/regvalue_test_utils.cpp \
../lib/pin2.14/source/tools/Regvalue/regvalues.cpp \
../lib/pin2.14/source/tools/Regvalue/xsave_iarg_mem.cpp \
../lib/pin2.14/source/tools/Regvalue/xsave_iarg_mem_app.cpp \
../lib/pin2.14/source/tools/Regvalue/xstateBVUtils.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/Regvalue/print_flags.c 

OBJS += \
./lib/pin2.14/source/tools/Regvalue/changeRegs_ia32.o \
./lib/pin2.14/source/tools/Regvalue/changeRegs_intel64.o \
./lib/pin2.14/source/tools/Regvalue/change_context_regvalue.o \
./lib/pin2.14/source/tools/Regvalue/checkXStateBV_app.o \
./lib/pin2.14/source/tools/Regvalue/checkXStateBV_tool.o \
./lib/pin2.14/source/tools/Regvalue/context_regvalue.o \
./lib/pin2.14/source/tools/Regvalue/context_utils.o \
./lib/pin2.14/source/tools/Regvalue/doXsave_ia32.o \
./lib/pin2.14/source/tools/Regvalue/doXsave_intel64.o \
./lib/pin2.14/source/tools/Regvalue/emu_context_regvalue.o \
./lib/pin2.14/source/tools/Regvalue/iarg_reg_reference.o \
./lib/pin2.14/source/tools/Regvalue/iarg_reg_reference_flags.o \
./lib/pin2.14/source/tools/Regvalue/print_flags.o \
./lib/pin2.14/source/tools/Regvalue/print_flags_asm.o \
./lib/pin2.14/source/tools/Regvalue/register_modification_utils.o \
./lib/pin2.14/source/tools/Regvalue/regvalue_app.o \
./lib/pin2.14/source/tools/Regvalue/regvalue_test_utils.o \
./lib/pin2.14/source/tools/Regvalue/regvalues.o \
./lib/pin2.14/source/tools/Regvalue/xsave_iarg_mem.o \
./lib/pin2.14/source/tools/Regvalue/xsave_iarg_mem_app.o \
./lib/pin2.14/source/tools/Regvalue/xstateBVUtils.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Regvalue/change_context_regvalue.d \
./lib/pin2.14/source/tools/Regvalue/checkXStateBV_app.d \
./lib/pin2.14/source/tools/Regvalue/checkXStateBV_tool.d \
./lib/pin2.14/source/tools/Regvalue/context_regvalue.d \
./lib/pin2.14/source/tools/Regvalue/context_utils.d \
./lib/pin2.14/source/tools/Regvalue/emu_context_regvalue.d \
./lib/pin2.14/source/tools/Regvalue/iarg_reg_reference.d \
./lib/pin2.14/source/tools/Regvalue/iarg_reg_reference_flags.d \
./lib/pin2.14/source/tools/Regvalue/register_modification_utils.d \
./lib/pin2.14/source/tools/Regvalue/regvalue_app.d \
./lib/pin2.14/source/tools/Regvalue/regvalue_test_utils.d \
./lib/pin2.14/source/tools/Regvalue/regvalues.d \
./lib/pin2.14/source/tools/Regvalue/xsave_iarg_mem.d \
./lib/pin2.14/source/tools/Regvalue/xsave_iarg_mem_app.d \
./lib/pin2.14/source/tools/Regvalue/xstateBVUtils.d 

C_DEPS += \
./lib/pin2.14/source/tools/Regvalue/print_flags.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Regvalue/%.o: ../lib/pin2.14/source/tools/Regvalue/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Regvalue/%.o: ../lib/pin2.14/source/tools/Regvalue/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Regvalue/%.o: ../lib/pin2.14/source/tools/Regvalue/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


