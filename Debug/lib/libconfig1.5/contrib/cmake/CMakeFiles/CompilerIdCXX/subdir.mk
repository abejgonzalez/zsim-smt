################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdCXX/CMakeCXXCompilerId.cpp 

OBJS += \
./lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdCXX/CMakeCXXCompilerId.o 

CPP_DEPS += \
./lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdCXX/CMakeCXXCompilerId.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdCXX/%.o: ../lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdCXX/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


