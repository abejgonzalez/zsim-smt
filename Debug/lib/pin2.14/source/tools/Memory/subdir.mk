################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/Memory/access_protection_app.cpp \
../lib/pin2.14/source/tools/Memory/address_mapping.cpp \
../lib/pin2.14/source/tools/Memory/address_mapping_probe.cpp \
../lib/pin2.14/source/tools/Memory/allcache.cpp \
../lib/pin2.14/source/tools/Memory/big_malloc.cpp \
../lib/pin2.14/source/tools/Memory/dcache.cpp \
../lib/pin2.14/source/tools/Memory/dcache_xscale_config.cpp \
../lib/pin2.14/source/tools/Memory/footprint.cpp \
../lib/pin2.14/source/tools/Memory/icache.cpp \
../lib/pin2.14/source/tools/Memory/memalign.cpp \
../lib/pin2.14/source/tools/Memory/memalloc.cpp \
../lib/pin2.14/source/tools/Memory/memalloc2.cpp \
../lib/pin2.14/source/tools/Memory/memory_allocation_from_app_access_protection_tool.cpp \
../lib/pin2.14/source/tools/Memory/memory_allocation_from_tool_access_protection_tool.cpp \
../lib/pin2.14/source/tools/Memory/memory_limit.cpp \
../lib/pin2.14/source/tools/Memory/mmap_reader_app.cpp \
../lib/pin2.14/source/tools/Memory/new_delete_app.cpp \
../lib/pin2.14/source/tools/Memory/new_delete_tool.cpp \
../lib/pin2.14/source/tools/Memory/restrict_memory_vdso.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/Memory/print_stack.c \
../lib/pin2.14/source/tools/Memory/print_vdso.c 

OBJS += \
./lib/pin2.14/source/tools/Memory/access_protection_app.o \
./lib/pin2.14/source/tools/Memory/address_mapping.o \
./lib/pin2.14/source/tools/Memory/address_mapping_probe.o \
./lib/pin2.14/source/tools/Memory/allcache.o \
./lib/pin2.14/source/tools/Memory/big_malloc.o \
./lib/pin2.14/source/tools/Memory/dcache.o \
./lib/pin2.14/source/tools/Memory/dcache_xscale_config.o \
./lib/pin2.14/source/tools/Memory/footprint.o \
./lib/pin2.14/source/tools/Memory/icache.o \
./lib/pin2.14/source/tools/Memory/memalign.o \
./lib/pin2.14/source/tools/Memory/memalloc.o \
./lib/pin2.14/source/tools/Memory/memalloc2.o \
./lib/pin2.14/source/tools/Memory/memory_allocation_from_app_access_protection_tool.o \
./lib/pin2.14/source/tools/Memory/memory_allocation_from_tool_access_protection_tool.o \
./lib/pin2.14/source/tools/Memory/memory_limit.o \
./lib/pin2.14/source/tools/Memory/mmap_reader_app.o \
./lib/pin2.14/source/tools/Memory/new_delete_app.o \
./lib/pin2.14/source/tools/Memory/new_delete_tool.o \
./lib/pin2.14/source/tools/Memory/print_stack.o \
./lib/pin2.14/source/tools/Memory/print_vdso.o \
./lib/pin2.14/source/tools/Memory/restrict_memory_vdso.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Memory/access_protection_app.d \
./lib/pin2.14/source/tools/Memory/address_mapping.d \
./lib/pin2.14/source/tools/Memory/address_mapping_probe.d \
./lib/pin2.14/source/tools/Memory/allcache.d \
./lib/pin2.14/source/tools/Memory/big_malloc.d \
./lib/pin2.14/source/tools/Memory/dcache.d \
./lib/pin2.14/source/tools/Memory/dcache_xscale_config.d \
./lib/pin2.14/source/tools/Memory/footprint.d \
./lib/pin2.14/source/tools/Memory/icache.d \
./lib/pin2.14/source/tools/Memory/memalign.d \
./lib/pin2.14/source/tools/Memory/memalloc.d \
./lib/pin2.14/source/tools/Memory/memalloc2.d \
./lib/pin2.14/source/tools/Memory/memory_allocation_from_app_access_protection_tool.d \
./lib/pin2.14/source/tools/Memory/memory_allocation_from_tool_access_protection_tool.d \
./lib/pin2.14/source/tools/Memory/memory_limit.d \
./lib/pin2.14/source/tools/Memory/mmap_reader_app.d \
./lib/pin2.14/source/tools/Memory/new_delete_app.d \
./lib/pin2.14/source/tools/Memory/new_delete_tool.d \
./lib/pin2.14/source/tools/Memory/restrict_memory_vdso.d 

C_DEPS += \
./lib/pin2.14/source/tools/Memory/print_stack.d \
./lib/pin2.14/source/tools/Memory/print_vdso.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Memory/%.o: ../lib/pin2.14/source/tools/Memory/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Memory/%.o: ../lib/pin2.14/source/tools/Memory/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


