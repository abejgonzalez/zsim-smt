################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/hdf5/share/hdf5_examples/hl/c/ex_ds1.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_image1.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_image2.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_lite1.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_lite2.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_lite3.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_01.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_02.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_03.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_04.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_05.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_06.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_07.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_08.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_09.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_10.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_11.c \
../lib/hdf5/share/hdf5_examples/hl/c/ex_table_12.c \
../lib/hdf5/share/hdf5_examples/hl/c/ptExampleFL.c 

OBJS += \
./lib/hdf5/share/hdf5_examples/hl/c/ex_ds1.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_image1.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_image2.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_lite1.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_lite2.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_lite3.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_01.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_02.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_03.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_04.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_05.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_06.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_07.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_08.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_09.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_10.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_11.o \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_12.o \
./lib/hdf5/share/hdf5_examples/hl/c/ptExampleFL.o 

C_DEPS += \
./lib/hdf5/share/hdf5_examples/hl/c/ex_ds1.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_image1.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_image2.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_lite1.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_lite2.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_lite3.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_01.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_02.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_03.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_04.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_05.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_06.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_07.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_08.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_09.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_10.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_11.d \
./lib/hdf5/share/hdf5_examples/hl/c/ex_table_12.d \
./lib/hdf5/share/hdf5_examples/hl/c/ptExampleFL.d 


# Each subdirectory must supply rules for building sources it contributes
lib/hdf5/share/hdf5_examples/hl/c/%.o: ../lib/hdf5/share/hdf5_examples/hl/c/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


