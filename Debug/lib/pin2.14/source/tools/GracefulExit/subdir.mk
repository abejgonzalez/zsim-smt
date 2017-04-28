################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/GracefulExit/applicationexit.cpp \
../lib/pin2.14/source/tools/GracefulExit/exitApplicationLocked_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/exitApplicationLocked_tool.cpp \
../lib/pin2.14/source/tools/GracefulExit/exitFromFini_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/exitFromFini_tool.cpp \
../lib/pin2.14/source/tools/GracefulExit/raceToEnterVm_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/raceToExit_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadFini_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadFini_exception_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadFini_sendsig.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadFini_sig_app.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadFini_tool.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadUtils_android.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadUtils_linux.cpp \
../lib/pin2.14/source/tools/GracefulExit/threadUtils_windows.cpp 

OBJS += \
./lib/pin2.14/source/tools/GracefulExit/applicationexit.o \
./lib/pin2.14/source/tools/GracefulExit/exitApplicationLocked_app.o \
./lib/pin2.14/source/tools/GracefulExit/exitApplicationLocked_tool.o \
./lib/pin2.14/source/tools/GracefulExit/exitFromFini_app.o \
./lib/pin2.14/source/tools/GracefulExit/exitFromFini_tool.o \
./lib/pin2.14/source/tools/GracefulExit/raceToEnterVm_app.o \
./lib/pin2.14/source/tools/GracefulExit/raceToExit_app.o \
./lib/pin2.14/source/tools/GracefulExit/threadFini_app.o \
./lib/pin2.14/source/tools/GracefulExit/threadFini_exception_app.o \
./lib/pin2.14/source/tools/GracefulExit/threadFini_sendsig.o \
./lib/pin2.14/source/tools/GracefulExit/threadFini_sig_app.o \
./lib/pin2.14/source/tools/GracefulExit/threadFini_tool.o \
./lib/pin2.14/source/tools/GracefulExit/threadUtils_android.o \
./lib/pin2.14/source/tools/GracefulExit/threadUtils_linux.o \
./lib/pin2.14/source/tools/GracefulExit/threadUtils_windows.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/GracefulExit/applicationexit.d \
./lib/pin2.14/source/tools/GracefulExit/exitApplicationLocked_app.d \
./lib/pin2.14/source/tools/GracefulExit/exitApplicationLocked_tool.d \
./lib/pin2.14/source/tools/GracefulExit/exitFromFini_app.d \
./lib/pin2.14/source/tools/GracefulExit/exitFromFini_tool.d \
./lib/pin2.14/source/tools/GracefulExit/raceToEnterVm_app.d \
./lib/pin2.14/source/tools/GracefulExit/raceToExit_app.d \
./lib/pin2.14/source/tools/GracefulExit/threadFini_app.d \
./lib/pin2.14/source/tools/GracefulExit/threadFini_exception_app.d \
./lib/pin2.14/source/tools/GracefulExit/threadFini_sendsig.d \
./lib/pin2.14/source/tools/GracefulExit/threadFini_sig_app.d \
./lib/pin2.14/source/tools/GracefulExit/threadFini_tool.d \
./lib/pin2.14/source/tools/GracefulExit/threadUtils_android.d \
./lib/pin2.14/source/tools/GracefulExit/threadUtils_linux.d \
./lib/pin2.14/source/tools/GracefulExit/threadUtils_windows.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/GracefulExit/%.o: ../lib/pin2.14/source/tools/GracefulExit/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


