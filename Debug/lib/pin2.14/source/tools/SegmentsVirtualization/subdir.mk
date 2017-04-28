################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/SegmentsVirtualization/fixed_base_reg.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_ia32.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_intel64.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_mic.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/modify_ldt.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area1.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area2.cpp \
../lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area3.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/SegmentsVirtualization/gcc_thread_local_vars_app.c 

OBJS += \
./lib/pin2.14/source/tools/SegmentsVirtualization/fixed_base_reg.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/gcc_thread_local_vars_app.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_ia32.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_intel64.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_mic.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/modify_ldt.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area1.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area2.o \
./lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area3.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/SegmentsVirtualization/fixed_base_reg.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_ia32.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_intel64.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/load_far_pointer_mic.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/modify_ldt.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area1.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area2.d \
./lib/pin2.14/source/tools/SegmentsVirtualization/set_thread_area3.d 

C_DEPS += \
./lib/pin2.14/source/tools/SegmentsVirtualization/gcc_thread_local_vars_app.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/SegmentsVirtualization/%.o: ../lib/pin2.14/source/tools/SegmentsVirtualization/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/SegmentsVirtualization/%.o: ../lib/pin2.14/source/tools/SegmentsVirtualization/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


