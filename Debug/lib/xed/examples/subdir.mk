################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/xed/examples/udhelp.cpp \
../lib/xed/examples/xed-disas-pecoff.cpp 

C_SRCS += \
../lib/xed/examples/avltree.c \
../lib/xed/examples/xed-dec-print.c \
../lib/xed/examples/xed-disas-elf.c \
../lib/xed/examples/xed-disas-hex.c \
../lib/xed/examples/xed-disas-macho.c \
../lib/xed/examples/xed-disas-raw.c \
../lib/xed/examples/xed-dll-discovery.c \
../lib/xed/examples/xed-dot-prep.c \
../lib/xed/examples/xed-dot.c \
../lib/xed/examples/xed-enc-lang.c \
../lib/xed/examples/xed-ex-agen.c \
../lib/xed/examples/xed-ex-ild.c \
../lib/xed/examples/xed-ex-ild2.c \
../lib/xed/examples/xed-ex1.c \
../lib/xed/examples/xed-ex3.c \
../lib/xed/examples/xed-ex4.c \
../lib/xed/examples/xed-ex5-enc.c \
../lib/xed/examples/xed-ex6.c \
../lib/xed/examples/xed-ex7.c \
../lib/xed/examples/xed-ex8.c \
../lib/xed/examples/xed-examples-util.c \
../lib/xed/examples/xed-min.c \
../lib/xed/examples/xed-reps.c \
../lib/xed/examples/xed-size.c \
../lib/xed/examples/xed-symbol-table.c \
../lib/xed/examples/xed-tables.c \
../lib/xed/examples/xed-tester.c \
../lib/xed/examples/xed.c 

OBJS += \
./lib/xed/examples/avltree.o \
./lib/xed/examples/udhelp.o \
./lib/xed/examples/xed-dec-print.o \
./lib/xed/examples/xed-disas-elf.o \
./lib/xed/examples/xed-disas-hex.o \
./lib/xed/examples/xed-disas-macho.o \
./lib/xed/examples/xed-disas-pecoff.o \
./lib/xed/examples/xed-disas-raw.o \
./lib/xed/examples/xed-dll-discovery.o \
./lib/xed/examples/xed-dot-prep.o \
./lib/xed/examples/xed-dot.o \
./lib/xed/examples/xed-enc-lang.o \
./lib/xed/examples/xed-ex-agen.o \
./lib/xed/examples/xed-ex-ild.o \
./lib/xed/examples/xed-ex-ild2.o \
./lib/xed/examples/xed-ex1.o \
./lib/xed/examples/xed-ex3.o \
./lib/xed/examples/xed-ex4.o \
./lib/xed/examples/xed-ex5-enc.o \
./lib/xed/examples/xed-ex6.o \
./lib/xed/examples/xed-ex7.o \
./lib/xed/examples/xed-ex8.o \
./lib/xed/examples/xed-examples-util.o \
./lib/xed/examples/xed-min.o \
./lib/xed/examples/xed-reps.o \
./lib/xed/examples/xed-size.o \
./lib/xed/examples/xed-symbol-table.o \
./lib/xed/examples/xed-tables.o \
./lib/xed/examples/xed-tester.o \
./lib/xed/examples/xed.o 

CPP_DEPS += \
./lib/xed/examples/udhelp.d \
./lib/xed/examples/xed-disas-pecoff.d 

C_DEPS += \
./lib/xed/examples/avltree.d \
./lib/xed/examples/xed-dec-print.d \
./lib/xed/examples/xed-disas-elf.d \
./lib/xed/examples/xed-disas-hex.d \
./lib/xed/examples/xed-disas-macho.d \
./lib/xed/examples/xed-disas-raw.d \
./lib/xed/examples/xed-dll-discovery.d \
./lib/xed/examples/xed-dot-prep.d \
./lib/xed/examples/xed-dot.d \
./lib/xed/examples/xed-enc-lang.d \
./lib/xed/examples/xed-ex-agen.d \
./lib/xed/examples/xed-ex-ild.d \
./lib/xed/examples/xed-ex-ild2.d \
./lib/xed/examples/xed-ex1.d \
./lib/xed/examples/xed-ex3.d \
./lib/xed/examples/xed-ex4.d \
./lib/xed/examples/xed-ex5-enc.d \
./lib/xed/examples/xed-ex6.d \
./lib/xed/examples/xed-ex7.d \
./lib/xed/examples/xed-ex8.d \
./lib/xed/examples/xed-examples-util.d \
./lib/xed/examples/xed-min.d \
./lib/xed/examples/xed-reps.d \
./lib/xed/examples/xed-size.d \
./lib/xed/examples/xed-symbol-table.d \
./lib/xed/examples/xed-tables.d \
./lib/xed/examples/xed-tester.d \
./lib/xed/examples/xed.d 


# Each subdirectory must supply rules for building sources it contributes
lib/xed/examples/%.o: ../lib/xed/examples/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/xed/examples/%.o: ../lib/xed/examples/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


