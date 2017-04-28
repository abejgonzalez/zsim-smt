################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/Buffer/allocate.cpp \
../lib/pin2.14/source/tools/Buffer/buffer-lengths.cpp \
../lib/pin2.14/source/tools/Buffer/buffer-predicate.cpp \
../lib/pin2.14/source/tools/Buffer/buffer-then.cpp \
../lib/pin2.14/source/tools/Buffer/buffer_invalid_reg.cpp \
../lib/pin2.14/source/tools/Buffer/bufferaddr.cpp \
../lib/pin2.14/source/tools/Buffer/buffererror.cpp \
../lib/pin2.14/source/tools/Buffer/mlog_buffer.cpp \
../lib/pin2.14/source/tools/Buffer/two_buffers.cpp 

OBJS += \
./lib/pin2.14/source/tools/Buffer/allocate.o \
./lib/pin2.14/source/tools/Buffer/buffer-lengths.o \
./lib/pin2.14/source/tools/Buffer/buffer-predicate.o \
./lib/pin2.14/source/tools/Buffer/buffer-then.o \
./lib/pin2.14/source/tools/Buffer/buffer_invalid_reg.o \
./lib/pin2.14/source/tools/Buffer/bufferaddr.o \
./lib/pin2.14/source/tools/Buffer/buffererror.o \
./lib/pin2.14/source/tools/Buffer/mlog_buffer.o \
./lib/pin2.14/source/tools/Buffer/two_buffers.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Buffer/allocate.d \
./lib/pin2.14/source/tools/Buffer/buffer-lengths.d \
./lib/pin2.14/source/tools/Buffer/buffer-predicate.d \
./lib/pin2.14/source/tools/Buffer/buffer-then.d \
./lib/pin2.14/source/tools/Buffer/buffer_invalid_reg.d \
./lib/pin2.14/source/tools/Buffer/bufferaddr.d \
./lib/pin2.14/source/tools/Buffer/buffererror.d \
./lib/pin2.14/source/tools/Buffer/mlog_buffer.d \
./lib/pin2.14/source/tools/Buffer/two_buffers.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Buffer/%.o: ../lib/pin2.14/source/tools/Buffer/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


