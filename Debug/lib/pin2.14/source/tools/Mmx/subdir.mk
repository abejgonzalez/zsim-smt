################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/Mmx/fpstack_ia32_win.asm \
../lib/pin2.14/source/tools/Mmx/mmxsequence_ia32_win.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/Mmx/mmx_test1_app.cpp \
../lib/pin2.14/source/tools/Mmx/mmx_test1_tool.cpp \
../lib/pin2.14/source/tools/Mmx/mmx_test2_app.cpp \
../lib/pin2.14/source/tools/Mmx/mmx_test2_tool.cpp 

OBJS += \
./lib/pin2.14/source/tools/Mmx/fpstack_ia32_win.o \
./lib/pin2.14/source/tools/Mmx/mmx_test1_app.o \
./lib/pin2.14/source/tools/Mmx/mmx_test1_tool.o \
./lib/pin2.14/source/tools/Mmx/mmx_test2_app.o \
./lib/pin2.14/source/tools/Mmx/mmx_test2_tool.o \
./lib/pin2.14/source/tools/Mmx/mmxsequence_ia32_win.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Mmx/mmx_test1_app.d \
./lib/pin2.14/source/tools/Mmx/mmx_test1_tool.d \
./lib/pin2.14/source/tools/Mmx/mmx_test2_app.d \
./lib/pin2.14/source/tools/Mmx/mmx_test2_tool.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Mmx/%.o: ../lib/pin2.14/source/tools/Mmx/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Mmx/%.o: ../lib/pin2.14/source/tools/Mmx/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


