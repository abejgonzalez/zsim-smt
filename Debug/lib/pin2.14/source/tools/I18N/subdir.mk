################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/I18N/i18n_tool.cpp \
../lib/pin2.14/source/tools/I18N/unix_unicode.cpp \
../lib/pin2.14/source/tools/I18N/unix_unicode_test_launcher.cpp \
../lib/pin2.14/source/tools/I18N/win_unicode.cpp \
../lib/pin2.14/source/tools/I18N/win_unicode_test_launcher.cpp 

OBJS += \
./lib/pin2.14/source/tools/I18N/i18n_tool.o \
./lib/pin2.14/source/tools/I18N/unix_unicode.o \
./lib/pin2.14/source/tools/I18N/unix_unicode_test_launcher.o \
./lib/pin2.14/source/tools/I18N/win_unicode.o \
./lib/pin2.14/source/tools/I18N/win_unicode_test_launcher.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/I18N/i18n_tool.d \
./lib/pin2.14/source/tools/I18N/unix_unicode.d \
./lib/pin2.14/source/tools/I18N/unix_unicode_test_launcher.d \
./lib/pin2.14/source/tools/I18N/win_unicode.d \
./lib/pin2.14/source/tools/I18N/win_unicode_test_launcher.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/I18N/%.o: ../lib/pin2.14/source/tools/I18N/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


