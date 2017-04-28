################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/access_tracing.cpp \
../src/cache.cpp \
../src/cache_arrays.cpp \
../src/coherence_ctrls.cpp \
../src/config.cpp \
../src/contention_sim.cpp \
../src/core_recorder.cpp \
../src/ddr_mem.cpp \
../src/debug_harness.cpp \
../src/debug_zsim.cpp \
../src/decoder.cpp \
../src/detailed_mem.cpp \
../src/detailed_mem_params.cpp \
../src/dramsim_mem_ctrl.cpp \
../src/dumptrace.cpp \
../src/fftoggle.cpp \
../src/galloc.cpp \
../src/hash.cpp \
../src/hdf5_stats.cpp \
../src/init.cpp \
../src/log.cpp \
../src/lookahead.cpp \
../src/mem_ctrls.cpp \
../src/memory_hierarchy.cpp \
../src/monitor.cpp \
../src/network.cpp \
../src/null_core.cpp \
../src/ooo_core.cpp \
../src/ooo_core_recorder.cpp \
../src/parse_vdso.cpp \
../src/partition_mapper.cpp \
../src/pin_cmd.cpp \
../src/prefetcher.cpp \
../src/proc_stats.cpp \
../src/process_stats.cpp \
../src/process_tree.cpp \
../src/scheduler.cpp \
../src/simple_core.cpp \
../src/sorttrace.cpp \
../src/stats_filter.cpp \
../src/text_stats.cpp \
../src/timing_cache.cpp \
../src/timing_core.cpp \
../src/timing_event.cpp \
../src/trace_driver.cpp \
../src/tracing_cache.cpp \
../src/utility_monitor.cpp \
../src/zsim.cpp \
../src/zsim_harness.cpp 

OBJS += \
./src/access_tracing.o \
./src/cache.o \
./src/cache_arrays.o \
./src/coherence_ctrls.o \
./src/config.o \
./src/contention_sim.o \
./src/core_recorder.o \
./src/ddr_mem.o \
./src/debug_harness.o \
./src/debug_zsim.o \
./src/decoder.o \
./src/detailed_mem.o \
./src/detailed_mem_params.o \
./src/dramsim_mem_ctrl.o \
./src/dumptrace.o \
./src/fftoggle.o \
./src/galloc.o \
./src/hash.o \
./src/hdf5_stats.o \
./src/init.o \
./src/log.o \
./src/lookahead.o \
./src/mem_ctrls.o \
./src/memory_hierarchy.o \
./src/monitor.o \
./src/network.o \
./src/null_core.o \
./src/ooo_core.o \
./src/ooo_core_recorder.o \
./src/parse_vdso.o \
./src/partition_mapper.o \
./src/pin_cmd.o \
./src/prefetcher.o \
./src/proc_stats.o \
./src/process_stats.o \
./src/process_tree.o \
./src/scheduler.o \
./src/simple_core.o \
./src/sorttrace.o \
./src/stats_filter.o \
./src/text_stats.o \
./src/timing_cache.o \
./src/timing_core.o \
./src/timing_event.o \
./src/trace_driver.o \
./src/tracing_cache.o \
./src/utility_monitor.o \
./src/zsim.o \
./src/zsim_harness.o 

CPP_DEPS += \
./src/access_tracing.d \
./src/cache.d \
./src/cache_arrays.d \
./src/coherence_ctrls.d \
./src/config.d \
./src/contention_sim.d \
./src/core_recorder.d \
./src/ddr_mem.d \
./src/debug_harness.d \
./src/debug_zsim.d \
./src/decoder.d \
./src/detailed_mem.d \
./src/detailed_mem_params.d \
./src/dramsim_mem_ctrl.d \
./src/dumptrace.d \
./src/fftoggle.d \
./src/galloc.d \
./src/hash.d \
./src/hdf5_stats.d \
./src/init.d \
./src/log.d \
./src/lookahead.d \
./src/mem_ctrls.d \
./src/memory_hierarchy.d \
./src/monitor.d \
./src/network.d \
./src/null_core.d \
./src/ooo_core.d \
./src/ooo_core_recorder.d \
./src/parse_vdso.d \
./src/partition_mapper.d \
./src/pin_cmd.d \
./src/prefetcher.d \
./src/proc_stats.d \
./src/process_stats.d \
./src/process_tree.d \
./src/scheduler.d \
./src/simple_core.d \
./src/sorttrace.d \
./src/stats_filter.d \
./src/text_stats.d \
./src/timing_cache.d \
./src/timing_core.d \
./src/timing_event.d \
./src/trace_driver.d \
./src/tracing_cache.d \
./src/utility_monitor.d \
./src/zsim.d \
./src/zsim_harness.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


