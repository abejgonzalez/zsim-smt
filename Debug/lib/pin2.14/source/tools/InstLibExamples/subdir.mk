################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/InstLibExamples/control.cpp \
../lib/pin2.14/source/tools/InstLibExamples/control_detach.cpp \
../lib/pin2.14/source/tools/InstLibExamples/filter.cpp \
../lib/pin2.14/source/tools/InstLibExamples/follow_child.cpp \
../lib/pin2.14/source/tools/InstLibExamples/icount.cpp \
../lib/pin2.14/source/tools/InstLibExamples/test-mt3.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/InstLibExamples/filter_app.c \
../lib/pin2.14/source/tools/InstLibExamples/int3-test.c \
../lib/pin2.14/source/tools/InstLibExamples/itext-marker-test.c \
../lib/pin2.14/source/tools/InstLibExamples/multi-start-stop-test.c \
../lib/pin2.14/source/tools/InstLibExamples/one.c 

OBJS += \
./lib/pin2.14/source/tools/InstLibExamples/control.o \
./lib/pin2.14/source/tools/InstLibExamples/control_detach.o \
./lib/pin2.14/source/tools/InstLibExamples/filter.o \
./lib/pin2.14/source/tools/InstLibExamples/filter_app.o \
./lib/pin2.14/source/tools/InstLibExamples/follow_child.o \
./lib/pin2.14/source/tools/InstLibExamples/icount.o \
./lib/pin2.14/source/tools/InstLibExamples/int3-test.o \
./lib/pin2.14/source/tools/InstLibExamples/itext-marker-test.o \
./lib/pin2.14/source/tools/InstLibExamples/multi-start-stop-test.o \
./lib/pin2.14/source/tools/InstLibExamples/one.o \
./lib/pin2.14/source/tools/InstLibExamples/test-mt3.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/InstLibExamples/control.d \
./lib/pin2.14/source/tools/InstLibExamples/control_detach.d \
./lib/pin2.14/source/tools/InstLibExamples/filter.d \
./lib/pin2.14/source/tools/InstLibExamples/follow_child.d \
./lib/pin2.14/source/tools/InstLibExamples/icount.d \
./lib/pin2.14/source/tools/InstLibExamples/test-mt3.d 

C_DEPS += \
./lib/pin2.14/source/tools/InstLibExamples/filter_app.d \
./lib/pin2.14/source/tools/InstLibExamples/int3-test.d \
./lib/pin2.14/source/tools/InstLibExamples/itext-marker-test.d \
./lib/pin2.14/source/tools/InstLibExamples/multi-start-stop-test.d \
./lib/pin2.14/source/tools/InstLibExamples/one.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/InstLibExamples/%.o: ../lib/pin2.14/source/tools/InstLibExamples/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/InstLibExamples/%.o: ../lib/pin2.14/source/tools/InstLibExamples/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


