################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/MemTrace/atomic_increment_ia32.asm \
../lib/pin2.14/source/tools/MemTrace/atomic_increment_intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/MemTrace/membuffer.cpp \
../lib/pin2.14/source/tools/MemTrace/membuffer_simple.cpp \
../lib/pin2.14/source/tools/MemTrace/membuffer_simple_tid.cpp \
../lib/pin2.14/source/tools/MemTrace/membuffer_threadpool.cpp \
../lib/pin2.14/source/tools/MemTrace/memtrace.cpp \
../lib/pin2.14/source/tools/MemTrace/memtrace_simple.cpp \
../lib/pin2.14/source/tools/MemTrace/memtrace_threadpool.cpp \
../lib/pin2.14/source/tools/MemTrace/thread2.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/MemTrace/thread.c 

OBJS += \
./lib/pin2.14/source/tools/MemTrace/atomic_increment_ia32.o \
./lib/pin2.14/source/tools/MemTrace/atomic_increment_intel64.o \
./lib/pin2.14/source/tools/MemTrace/membuffer.o \
./lib/pin2.14/source/tools/MemTrace/membuffer_simple.o \
./lib/pin2.14/source/tools/MemTrace/membuffer_simple_tid.o \
./lib/pin2.14/source/tools/MemTrace/membuffer_threadpool.o \
./lib/pin2.14/source/tools/MemTrace/memtrace.o \
./lib/pin2.14/source/tools/MemTrace/memtrace_simple.o \
./lib/pin2.14/source/tools/MemTrace/memtrace_threadpool.o \
./lib/pin2.14/source/tools/MemTrace/thread.o \
./lib/pin2.14/source/tools/MemTrace/thread2.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/MemTrace/membuffer.d \
./lib/pin2.14/source/tools/MemTrace/membuffer_simple.d \
./lib/pin2.14/source/tools/MemTrace/membuffer_simple_tid.d \
./lib/pin2.14/source/tools/MemTrace/membuffer_threadpool.d \
./lib/pin2.14/source/tools/MemTrace/memtrace.d \
./lib/pin2.14/source/tools/MemTrace/memtrace_simple.d \
./lib/pin2.14/source/tools/MemTrace/memtrace_threadpool.d \
./lib/pin2.14/source/tools/MemTrace/thread2.d 

C_DEPS += \
./lib/pin2.14/source/tools/MemTrace/thread.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/MemTrace/%.o: ../lib/pin2.14/source/tools/MemTrace/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/MemTrace/%.o: ../lib/pin2.14/source/tools/MemTrace/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/MemTrace/%.o: ../lib/pin2.14/source/tools/MemTrace/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


