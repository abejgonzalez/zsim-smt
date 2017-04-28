################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/MacTests/bundle_tool.cpp \
../lib/pin2.14/source/tools/MacTests/section_tool.cpp \
../lib/pin2.14/source/tools/MacTests/thcnt.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/MacTests/bundle_app.c \
../lib/pin2.14/source/tools/MacTests/bundle_bundle.c \
../lib/pin2.14/source/tools/MacTests/libdep.c \
../lib/pin2.14/source/tools/MacTests/mylib.c \
../lib/pin2.14/source/tools/MacTests/section_app.c \
../lib/pin2.14/source/tools/MacTests/wqtimer.c 

OBJS += \
./lib/pin2.14/source/tools/MacTests/bundle_app.o \
./lib/pin2.14/source/tools/MacTests/bundle_bundle.o \
./lib/pin2.14/source/tools/MacTests/bundle_tool.o \
./lib/pin2.14/source/tools/MacTests/libdep.o \
./lib/pin2.14/source/tools/MacTests/mylib.o \
./lib/pin2.14/source/tools/MacTests/section_app.o \
./lib/pin2.14/source/tools/MacTests/section_tool.o \
./lib/pin2.14/source/tools/MacTests/thcnt.o \
./lib/pin2.14/source/tools/MacTests/wqtimer.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/MacTests/bundle_tool.d \
./lib/pin2.14/source/tools/MacTests/section_tool.d \
./lib/pin2.14/source/tools/MacTests/thcnt.d 

C_DEPS += \
./lib/pin2.14/source/tools/MacTests/bundle_app.d \
./lib/pin2.14/source/tools/MacTests/bundle_bundle.d \
./lib/pin2.14/source/tools/MacTests/libdep.d \
./lib/pin2.14/source/tools/MacTests/mylib.d \
./lib/pin2.14/source/tools/MacTests/section_app.d \
./lib/pin2.14/source/tools/MacTests/wqtimer.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/MacTests/%.o: ../lib/pin2.14/source/tools/MacTests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/MacTests/%.o: ../lib/pin2.14/source/tools/MacTests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


