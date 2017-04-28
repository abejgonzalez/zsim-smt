################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C++_SRCS += \
../lib/libconfig1.5/lib/libconfigcpp.c++ 

CC_SRCS += \
../lib/libconfig1.5/lib/libconfigcpp.cc 

C_SRCS += \
../lib/libconfig1.5/lib/grammar.c \
../lib/libconfig1.5/lib/libconfig.c \
../lib/libconfig1.5/lib/scanctx.c \
../lib/libconfig1.5/lib/scanner.c \
../lib/libconfig1.5/lib/strbuf.c 

O_SRCS += \
../lib/libconfig1.5/lib/libconfig___la-grammar.o \
../lib/libconfig1.5/lib/libconfig___la-libconfig.o \
../lib/libconfig1.5/lib/libconfig___la-libconfigcpp.o \
../lib/libconfig1.5/lib/libconfig___la-scanctx.o \
../lib/libconfig1.5/lib/libconfig___la-scanner.o \
../lib/libconfig1.5/lib/libconfig___la-strbuf.o \
../lib/libconfig1.5/lib/libconfig_la-grammar.o \
../lib/libconfig1.5/lib/libconfig_la-libconfig.o \
../lib/libconfig1.5/lib/libconfig_la-scanctx.o \
../lib/libconfig1.5/lib/libconfig_la-scanner.o \
../lib/libconfig1.5/lib/libconfig_la-strbuf.o 

CC_DEPS += \
./lib/libconfig1.5/lib/libconfigcpp.d 

C++_DEPS += \
./lib/libconfig1.5/lib/libconfigcpp.d 

OBJS += \
./lib/libconfig1.5/lib/grammar.o \
./lib/libconfig1.5/lib/libconfig.o \
./lib/libconfig1.5/lib/libconfigcpp.o \
./lib/libconfig1.5/lib/scanctx.o \
./lib/libconfig1.5/lib/scanner.o \
./lib/libconfig1.5/lib/strbuf.o 

C_DEPS += \
./lib/libconfig1.5/lib/grammar.d \
./lib/libconfig1.5/lib/libconfig.d \
./lib/libconfig1.5/lib/scanctx.d \
./lib/libconfig1.5/lib/scanner.d \
./lib/libconfig1.5/lib/strbuf.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/lib/%.o: ../lib/libconfig1.5/lib/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/libconfig1.5/lib/%.o: ../lib/libconfig1.5/lib/%.c++
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/libconfig1.5/lib/%.o: ../lib/libconfig1.5/lib/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


