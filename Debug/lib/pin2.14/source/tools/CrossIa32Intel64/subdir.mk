################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/child_process_linux.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/child_process_windows.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/early_termination.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool_sym.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool_windows.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/grand_child_process_linux.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/grand_child_process_windows.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/parent_process_linux.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/parent_process_windows.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/parent_tool.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/sigchld_app.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/w_terminate_process_dll.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/win_launcher_debugged_process.cpp \
../lib/pin2.14/source/tools/CrossIa32Intel64/win_launcher_process.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection_app.c \
../lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection_app1.c 

OBJS += \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection_app.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection_app1.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_linux.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_windows.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/early_termination.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool_sym.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool_windows.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/grand_child_process_linux.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/grand_child_process_windows.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/parent_process_linux.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/parent_process_windows.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/parent_tool.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/sigchld_app.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/w_terminate_process_dll.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/win_launcher_debugged_process.o \
./lib/pin2.14/source/tools/CrossIa32Intel64/win_launcher_process.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_linux.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_windows.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/early_termination.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool_sym.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/follow_child_tool_windows.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/grand_child_process_linux.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/grand_child_process_windows.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/parent_process_linux.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/parent_process_windows.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/parent_tool.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/sigchld_app.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/w_terminate_process_dll.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/win_launcher_debugged_process.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/win_launcher_process.d 

C_DEPS += \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection_app.d \
./lib/pin2.14/source/tools/CrossIa32Intel64/child_process_injection_app1.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/CrossIa32Intel64/%.o: ../lib/pin2.14/source/tools/CrossIa32Intel64/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/CrossIa32Intel64/%.o: ../lib/pin2.14/source/tools/CrossIa32Intel64/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


