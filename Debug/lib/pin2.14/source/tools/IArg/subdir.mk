################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app_asm_ia32.asm \
../lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app_asm_intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea.cpp \
../lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app.cpp \
../lib/pin2.14/source/tools/IArg/iarg_inst_ptr_error_msg.cpp 

OBJS += \
./lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea.o \
./lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app.o \
./lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app_asm_ia32.o \
./lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app_asm_intel64.o \
./lib/pin2.14/source/tools/IArg/iarg_inst_ptr_error_msg.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea.d \
./lib/pin2.14/source/tools/IArg/iarg_explicit_memory_ea_app.d \
./lib/pin2.14/source/tools/IArg/iarg_inst_ptr_error_msg.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/IArg/%.o: ../lib/pin2.14/source/tools/IArg/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/IArg/%.o: ../lib/pin2.14/source/tools/IArg/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


