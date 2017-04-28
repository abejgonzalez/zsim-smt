################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/InstLib/alarm_manager.cpp \
../lib/pin2.14/source/tools/InstLib/alarms.cpp \
../lib/pin2.14/source/tools/InstLib/call-stack.cpp \
../lib/pin2.14/source/tools/InstLib/control_chain.cpp \
../lib/pin2.14/source/tools/InstLib/control_manager.cpp \
../lib/pin2.14/source/tools/InstLib/controller_events.cpp \
../lib/pin2.14/source/tools/InstLib/debugger-shell.cpp \
../lib/pin2.14/source/tools/InstLib/ialarm.cpp \
../lib/pin2.14/source/tools/InstLib/init_alarm.cpp \
../lib/pin2.14/source/tools/InstLib/interactive_listener.cpp \
../lib/pin2.14/source/tools/InstLib/parse_control.cpp 

OBJS += \
./lib/pin2.14/source/tools/InstLib/alarm_manager.o \
./lib/pin2.14/source/tools/InstLib/alarms.o \
./lib/pin2.14/source/tools/InstLib/call-stack.o \
./lib/pin2.14/source/tools/InstLib/control_chain.o \
./lib/pin2.14/source/tools/InstLib/control_manager.o \
./lib/pin2.14/source/tools/InstLib/controller_events.o \
./lib/pin2.14/source/tools/InstLib/debugger-shell.o \
./lib/pin2.14/source/tools/InstLib/ialarm.o \
./lib/pin2.14/source/tools/InstLib/init_alarm.o \
./lib/pin2.14/source/tools/InstLib/interactive_listener.o \
./lib/pin2.14/source/tools/InstLib/parse_control.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/InstLib/alarm_manager.d \
./lib/pin2.14/source/tools/InstLib/alarms.d \
./lib/pin2.14/source/tools/InstLib/call-stack.d \
./lib/pin2.14/source/tools/InstLib/control_chain.d \
./lib/pin2.14/source/tools/InstLib/control_manager.d \
./lib/pin2.14/source/tools/InstLib/controller_events.d \
./lib/pin2.14/source/tools/InstLib/debugger-shell.d \
./lib/pin2.14/source/tools/InstLib/ialarm.d \
./lib/pin2.14/source/tools/InstLib/init_alarm.d \
./lib/pin2.14/source/tools/InstLib/interactive_listener.d \
./lib/pin2.14/source/tools/InstLib/parse_control.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/InstLib/%.o: ../lib/pin2.14/source/tools/InstLib/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


