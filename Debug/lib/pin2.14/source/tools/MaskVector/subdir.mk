################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/MaskVector/iarg_reg_mask.cpp \
../lib/pin2.14/source/tools/MaskVector/maskedBranchTaken.cpp \
../lib/pin2.14/source/tools/MaskVector/maskedJump_app.cpp \
../lib/pin2.14/source/tools/MaskVector/memoryVector_app.cpp \
../lib/pin2.14/source/tools/MaskVector/vcount.cpp \
../lib/pin2.14/source/tools/MaskVector/vectorUtilization.cpp \
../lib/pin2.14/source/tools/MaskVector/vectorUtilizationTypes.cpp \
../lib/pin2.14/source/tools/MaskVector/vectorvalues.cpp 

OBJS += \
./lib/pin2.14/source/tools/MaskVector/iarg_reg_mask.o \
./lib/pin2.14/source/tools/MaskVector/maskedBranchTaken.o \
./lib/pin2.14/source/tools/MaskVector/maskedJump_app.o \
./lib/pin2.14/source/tools/MaskVector/memoryVector_app.o \
./lib/pin2.14/source/tools/MaskVector/vcount.o \
./lib/pin2.14/source/tools/MaskVector/vectorUtilization.o \
./lib/pin2.14/source/tools/MaskVector/vectorUtilizationTypes.o \
./lib/pin2.14/source/tools/MaskVector/vectorvalues.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/MaskVector/iarg_reg_mask.d \
./lib/pin2.14/source/tools/MaskVector/maskedBranchTaken.d \
./lib/pin2.14/source/tools/MaskVector/maskedJump_app.d \
./lib/pin2.14/source/tools/MaskVector/memoryVector_app.d \
./lib/pin2.14/source/tools/MaskVector/vcount.d \
./lib/pin2.14/source/tools/MaskVector/vectorUtilization.d \
./lib/pin2.14/source/tools/MaskVector/vectorUtilizationTypes.d \
./lib/pin2.14/source/tools/MaskVector/vectorvalues.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/MaskVector/%.o: ../lib/pin2.14/source/tools/MaskVector/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


