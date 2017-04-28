################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/MemTranslate/indirect_jmp.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/MemTranslate/indirect_jmp_with_translation.cpp \
../lib/pin2.14/source/tools/MemTranslate/memory_addr_callback.cpp \
../lib/pin2.14/source/tools/MemTranslate/memory_callback_error.cpp 

OBJS += \
./lib/pin2.14/source/tools/MemTranslate/indirect_jmp.o \
./lib/pin2.14/source/tools/MemTranslate/indirect_jmp_with_translation.o \
./lib/pin2.14/source/tools/MemTranslate/memory_addr_callback.o \
./lib/pin2.14/source/tools/MemTranslate/memory_callback_error.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/MemTranslate/indirect_jmp_with_translation.d \
./lib/pin2.14/source/tools/MemTranslate/memory_addr_callback.d \
./lib/pin2.14/source/tools/MemTranslate/memory_callback_error.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/MemTranslate/%.o: ../lib/pin2.14/source/tools/MemTranslate/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/MemTranslate/%.o: ../lib/pin2.14/source/tools/MemTranslate/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


