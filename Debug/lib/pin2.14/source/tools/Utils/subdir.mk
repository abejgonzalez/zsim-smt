################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/Utils/avx_check_ia32.asm \
../lib/pin2.14/source/tools/Utils/avx_check_intel64.asm \
../lib/pin2.14/source/tools/Utils/supports_avx2_ia32.asm \
../lib/pin2.14/source/tools/Utils/supports_avx2_intel64.asm \
../lib/pin2.14/source/tools/Utils/supports_avx_ia32.asm \
../lib/pin2.14/source/tools/Utils/supports_avx_intel64.asm \
../lib/pin2.14/source/tools/Utils/tsx_check_ia32.asm \
../lib/pin2.14/source/tools/Utils/tsx_check_intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/Utils/attachLauncher_unix.cpp \
../lib/pin2.14/source/tools/Utils/cp-pin.cpp \
../lib/pin2.14/source/tools/Utils/regvalue_utils.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/Utils/avx2_check.c \
../lib/pin2.14/source/tools/Utils/avx_check.c \
../lib/pin2.14/source/tools/Utils/disable-aslr.c \
../lib/pin2.14/source/tools/Utils/hello.c \
../lib/pin2.14/source/tools/Utils/threadlib_unix.c \
../lib/pin2.14/source/tools/Utils/threadlib_win.c \
../lib/pin2.14/source/tools/Utils/tsx_check.c 

OBJS += \
./lib/pin2.14/source/tools/Utils/attachLauncher_unix.o \
./lib/pin2.14/source/tools/Utils/avx2_check.o \
./lib/pin2.14/source/tools/Utils/avx_check.o \
./lib/pin2.14/source/tools/Utils/avx_check_ia32.o \
./lib/pin2.14/source/tools/Utils/avx_check_intel64.o \
./lib/pin2.14/source/tools/Utils/cp-pin.o \
./lib/pin2.14/source/tools/Utils/disable-aslr.o \
./lib/pin2.14/source/tools/Utils/hello.o \
./lib/pin2.14/source/tools/Utils/regvalue_utils.o \
./lib/pin2.14/source/tools/Utils/supports_avx2_ia32.o \
./lib/pin2.14/source/tools/Utils/supports_avx2_intel64.o \
./lib/pin2.14/source/tools/Utils/supports_avx_ia32.o \
./lib/pin2.14/source/tools/Utils/supports_avx_intel64.o \
./lib/pin2.14/source/tools/Utils/threadlib_unix.o \
./lib/pin2.14/source/tools/Utils/threadlib_win.o \
./lib/pin2.14/source/tools/Utils/tsx_check.o \
./lib/pin2.14/source/tools/Utils/tsx_check_ia32.o \
./lib/pin2.14/source/tools/Utils/tsx_check_intel64.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Utils/attachLauncher_unix.d \
./lib/pin2.14/source/tools/Utils/cp-pin.d \
./lib/pin2.14/source/tools/Utils/regvalue_utils.d 

C_DEPS += \
./lib/pin2.14/source/tools/Utils/avx2_check.d \
./lib/pin2.14/source/tools/Utils/avx_check.d \
./lib/pin2.14/source/tools/Utils/disable-aslr.d \
./lib/pin2.14/source/tools/Utils/hello.d \
./lib/pin2.14/source/tools/Utils/threadlib_unix.d \
./lib/pin2.14/source/tools/Utils/threadlib_win.d \
./lib/pin2.14/source/tools/Utils/tsx_check.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Utils/%.o: ../lib/pin2.14/source/tools/Utils/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Utils/%.o: ../lib/pin2.14/source/tools/Utils/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Utils/%.o: ../lib/pin2.14/source/tools/Utils/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


