################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../build/opt/access_tracing.cpp \
../build/opt/cache.cpp \
../build/opt/cache_arrays.cpp \
../build/opt/coherence_ctrls.cpp \
../build/opt/config.cpp \
../build/opt/contention_sim.cpp \
../build/opt/core_recorder.cpp \
../build/opt/ddr_mem.cpp \
../build/opt/debug_harness.cpp \
../build/opt/debug_zsim.cpp \
../build/opt/decoder.cpp \
../build/opt/detailed_mem.cpp \
../build/opt/detailed_mem_params.cpp \
../build/opt/dramsim_mem_ctrl.cpp \
../build/opt/dumptrace.cpp \
../build/opt/fftoggle.cpp \
../build/opt/galloc.cpp \
../build/opt/hash.cpp \
../build/opt/hdf5_stats.cpp \
../build/opt/init.cpp \
../build/opt/log.cpp \
../build/opt/lookahead.cpp \
../build/opt/mem_ctrls.cpp \
../build/opt/memory_hierarchy.cpp \
../build/opt/monitor.cpp \
../build/opt/network.cpp \
../build/opt/null_core.cpp \
../build/opt/ooo_core.cpp \
../build/opt/ooo_core_recorder.cpp \
../build/opt/parse_vdso.cpp \
../build/opt/partition_mapper.cpp \
../build/opt/pin_cmd.cpp \
../build/opt/prefetcher.cpp \
../build/opt/proc_stats.cpp \
../build/opt/process_stats.cpp \
../build/opt/process_tree.cpp \
../build/opt/scheduler.cpp \
../build/opt/simple_core.cpp \
../build/opt/sorttrace.cpp \
../build/opt/stats_filter.cpp \
../build/opt/text_stats.cpp \
../build/opt/timing_cache.cpp \
../build/opt/timing_core.cpp \
../build/opt/timing_event.cpp \
../build/opt/trace_driver.cpp \
../build/opt/tracing_cache.cpp \
../build/opt/utility_monitor.cpp \
../build/opt/zsim.cpp \
../build/opt/zsim_harness.cpp 

O_SRCS += \
../build/opt/config.o \
../build/opt/debug_harness.o \
../build/opt/fftoggle.o \
../build/opt/galloc.o \
../build/opt/log.o \
../build/opt/pin_cmd.o \
../build/opt/zsim_harness.o 

OBJS += \
./build/opt/access_tracing.o \
./build/opt/cache.o \
./build/opt/cache_arrays.o \
./build/opt/coherence_ctrls.o \
./build/opt/config.o \
./build/opt/contention_sim.o \
./build/opt/core_recorder.o \
./build/opt/ddr_mem.o \
./build/opt/debug_harness.o \
./build/opt/debug_zsim.o \
./build/opt/decoder.o \
./build/opt/detailed_mem.o \
./build/opt/detailed_mem_params.o \
./build/opt/dramsim_mem_ctrl.o \
./build/opt/dumptrace.o \
./build/opt/fftoggle.o \
./build/opt/galloc.o \
./build/opt/hash.o \
./build/opt/hdf5_stats.o \
./build/opt/init.o \
./build/opt/log.o \
./build/opt/lookahead.o \
./build/opt/mem_ctrls.o \
./build/opt/memory_hierarchy.o \
./build/opt/monitor.o \
./build/opt/network.o \
./build/opt/null_core.o \
./build/opt/ooo_core.o \
./build/opt/ooo_core_recorder.o \
./build/opt/parse_vdso.o \
./build/opt/partition_mapper.o \
./build/opt/pin_cmd.o \
./build/opt/prefetcher.o \
./build/opt/proc_stats.o \
./build/opt/process_stats.o \
./build/opt/process_tree.o \
./build/opt/scheduler.o \
./build/opt/simple_core.o \
./build/opt/sorttrace.o \
./build/opt/stats_filter.o \
./build/opt/text_stats.o \
./build/opt/timing_cache.o \
./build/opt/timing_core.o \
./build/opt/timing_event.o \
./build/opt/trace_driver.o \
./build/opt/tracing_cache.o \
./build/opt/utility_monitor.o \
./build/opt/zsim.o \
./build/opt/zsim_harness.o 

CPP_DEPS += \
./build/opt/access_tracing.d \
./build/opt/cache.d \
./build/opt/cache_arrays.d \
./build/opt/coherence_ctrls.d \
./build/opt/config.d \
./build/opt/contention_sim.d \
./build/opt/core_recorder.d \
./build/opt/ddr_mem.d \
./build/opt/debug_harness.d \
./build/opt/debug_zsim.d \
./build/opt/decoder.d \
./build/opt/detailed_mem.d \
./build/opt/detailed_mem_params.d \
./build/opt/dramsim_mem_ctrl.d \
./build/opt/dumptrace.d \
./build/opt/fftoggle.d \
./build/opt/galloc.d \
./build/opt/hash.d \
./build/opt/hdf5_stats.d \
./build/opt/init.d \
./build/opt/log.d \
./build/opt/lookahead.d \
./build/opt/mem_ctrls.d \
./build/opt/memory_hierarchy.d \
./build/opt/monitor.d \
./build/opt/network.d \
./build/opt/null_core.d \
./build/opt/ooo_core.d \
./build/opt/ooo_core_recorder.d \
./build/opt/parse_vdso.d \
./build/opt/partition_mapper.d \
./build/opt/pin_cmd.d \
./build/opt/prefetcher.d \
./build/opt/proc_stats.d \
./build/opt/process_stats.d \
./build/opt/process_tree.d \
./build/opt/scheduler.d \
./build/opt/simple_core.d \
./build/opt/sorttrace.d \
./build/opt/stats_filter.d \
./build/opt/text_stats.d \
./build/opt/timing_cache.d \
./build/opt/timing_core.d \
./build/opt/timing_event.d \
./build/opt/trace_driver.d \
./build/opt/tracing_cache.d \
./build/opt/utility_monitor.d \
./build/opt/zsim.d \
./build/opt/zsim_harness.d 


# Each subdirectory must supply rules for building sources it contributes
build/opt/%.o: ../build/opt/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


