################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/Debugger/simple-pindb-asm-windows-ia32.asm \
../lib/pin2.14/source/tools/Debugger/simple-pindb-asm-windows-intel64.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/Debugger/action-pending-app.cpp \
../lib/pin2.14/source/tools/Debugger/action-pending-tool.cpp \
../lib/pin2.14/source/tools/Debugger/app-pause-app.cpp \
../lib/pin2.14/source/tools/Debugger/app-pause-in-app-thread-tool.cpp \
../lib/pin2.14/source/tools/Debugger/app-pause-in-int-thread-tool.cpp \
../lib/pin2.14/source/tools/Debugger/bphandler.cpp \
../lib/pin2.14/source/tools/Debugger/bptest.cpp \
../lib/pin2.14/source/tools/Debugger/breaktool.cpp \
../lib/pin2.14/source/tools/Debugger/check-if-thread-stopped.cpp \
../lib/pin2.14/source/tools/Debugger/checkpoint.cpp \
../lib/pin2.14/source/tools/Debugger/debugger-shell-app.cpp \
../lib/pin2.14/source/tools/Debugger/debugger-type.cpp \
../lib/pin2.14/source/tools/Debugger/exec.cpp \
../lib/pin2.14/source/tools/Debugger/fork.cpp \
../lib/pin2.14/source/tools/Debugger/int3-count.cpp \
../lib/pin2.14/source/tools/Debugger/intercept-app.cpp \
../lib/pin2.14/source/tools/Debugger/intercept-tool.cpp \
../lib/pin2.14/source/tools/Debugger/interpreter-remove.cpp \
../lib/pin2.14/source/tools/Debugger/invalidate-regs.cpp \
../lib/pin2.14/source/tools/Debugger/launch-gdb-tool.cpp \
../lib/pin2.14/source/tools/Debugger/library-load-tool.cpp \
../lib/pin2.14/source/tools/Debugger/mt-exit-tool.cpp \
../lib/pin2.14/source/tools/Debugger/mt-exit.cpp \
../lib/pin2.14/source/tools/Debugger/null-emulator-ia32.cpp \
../lib/pin2.14/source/tools/Debugger/null-emulator-intel64.cpp \
../lib/pin2.14/source/tools/Debugger/pc-change-async-tool.cpp \
../lib/pin2.14/source/tools/Debugger/pc-change-async.cpp \
../lib/pin2.14/source/tools/Debugger/pc-change-bp.cpp \
../lib/pin2.14/source/tools/Debugger/pthread-bare-exit.cpp \
../lib/pin2.14/source/tools/Debugger/pthread-bare-exitgroup.cpp \
../lib/pin2.14/source/tools/Debugger/reattach-loop.cpp \
../lib/pin2.14/source/tools/Debugger/set-mode-tool.cpp \
../lib/pin2.14/source/tools/Debugger/set_xmm_scratches.cpp \
../lib/pin2.14/source/tools/Debugger/set_xmm_scratches_before_breakpoint.cpp \
../lib/pin2.14/source/tools/Debugger/set_xmm_scratches_before_breakpoint_and_set_xmm_reg.cpp \
../lib/pin2.14/source/tools/Debugger/set_xmm_scratches_for_ymmtest.cpp \
../lib/pin2.14/source/tools/Debugger/signal-catch.cpp \
../lib/pin2.14/source/tools/Debugger/simple-command-tool.cpp \
../lib/pin2.14/source/tools/Debugger/simple-pindb.cpp \
../lib/pin2.14/source/tools/Debugger/simultaneous-toolbreak.cpp \
../lib/pin2.14/source/tools/Debugger/start-fini-callback.cpp \
../lib/pin2.14/source/tools/Debugger/stop-resume-when-suspended.cpp \
../lib/pin2.14/source/tools/Debugger/thread-unix.cpp \
../lib/pin2.14/source/tools/Debugger/thread-win.cpp \
../lib/pin2.14/source/tools/Debugger/thread.cpp \
../lib/pin2.14/source/tools/Debugger/use-debugger-shell.cpp \
../lib/pin2.14/source/tools/Debugger/watchpoint.cpp \
../lib/pin2.14/source/tools/Debugger/win-continued-exception1.cpp \
../lib/pin2.14/source/tools/Debugger/win-continued-exception2.cpp \
../lib/pin2.14/source/tools/Debugger/win-cpp-exception.cpp \
../lib/pin2.14/source/tools/Debugger/win-foo-library.cpp \
../lib/pin2.14/source/tools/Debugger/win-handled-exception.cpp \
../lib/pin2.14/source/tools/Debugger/win-load-library.cpp \
../lib/pin2.14/source/tools/Debugger/win-software-exception.cpp \
../lib/pin2.14/source/tools/Debugger/win-thread-stress.cpp \
../lib/pin2.14/source/tools/Debugger/win-unhandled-exception.cpp \
../lib/pin2.14/source/tools/Debugger/ymm.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/Debugger/bphandler_app.c \
../lib/pin2.14/source/tools/Debugger/callerapp.c \
../lib/pin2.14/source/tools/Debugger/checkpoint-app.c \
../lib/pin2.14/source/tools/Debugger/dlopen-dlclose.c \
../lib/pin2.14/source/tools/Debugger/pick-random-port.c \
../lib/pin2.14/source/tools/Debugger/simple.c \
../lib/pin2.14/source/tools/Debugger/sleep-unix.c \
../lib/pin2.14/source/tools/Debugger/watchpoint-app.c \
../lib/pin2.14/source/tools/Debugger/xmm.c 

OBJS += \
./lib/pin2.14/source/tools/Debugger/action-pending-app.o \
./lib/pin2.14/source/tools/Debugger/action-pending-tool.o \
./lib/pin2.14/source/tools/Debugger/app-pause-app.o \
./lib/pin2.14/source/tools/Debugger/app-pause-in-app-thread-tool.o \
./lib/pin2.14/source/tools/Debugger/app-pause-in-int-thread-tool.o \
./lib/pin2.14/source/tools/Debugger/bphandler.o \
./lib/pin2.14/source/tools/Debugger/bphandler_app.o \
./lib/pin2.14/source/tools/Debugger/bptest.o \
./lib/pin2.14/source/tools/Debugger/breaktool.o \
./lib/pin2.14/source/tools/Debugger/callerapp.o \
./lib/pin2.14/source/tools/Debugger/check-if-thread-stopped.o \
./lib/pin2.14/source/tools/Debugger/checkpoint-app.o \
./lib/pin2.14/source/tools/Debugger/checkpoint.o \
./lib/pin2.14/source/tools/Debugger/debugger-shell-app.o \
./lib/pin2.14/source/tools/Debugger/debugger-type.o \
./lib/pin2.14/source/tools/Debugger/dlopen-dlclose.o \
./lib/pin2.14/source/tools/Debugger/exec.o \
./lib/pin2.14/source/tools/Debugger/fork.o \
./lib/pin2.14/source/tools/Debugger/int3-count.o \
./lib/pin2.14/source/tools/Debugger/intercept-app.o \
./lib/pin2.14/source/tools/Debugger/intercept-tool.o \
./lib/pin2.14/source/tools/Debugger/interpreter-remove.o \
./lib/pin2.14/source/tools/Debugger/invalidate-regs.o \
./lib/pin2.14/source/tools/Debugger/launch-gdb-tool.o \
./lib/pin2.14/source/tools/Debugger/library-load-tool.o \
./lib/pin2.14/source/tools/Debugger/mt-exit-tool.o \
./lib/pin2.14/source/tools/Debugger/mt-exit.o \
./lib/pin2.14/source/tools/Debugger/null-emulator-ia32.o \
./lib/pin2.14/source/tools/Debugger/null-emulator-intel64.o \
./lib/pin2.14/source/tools/Debugger/pc-change-async-tool.o \
./lib/pin2.14/source/tools/Debugger/pc-change-async.o \
./lib/pin2.14/source/tools/Debugger/pc-change-bp.o \
./lib/pin2.14/source/tools/Debugger/pick-random-port.o \
./lib/pin2.14/source/tools/Debugger/pthread-bare-exit.o \
./lib/pin2.14/source/tools/Debugger/pthread-bare-exitgroup.o \
./lib/pin2.14/source/tools/Debugger/reattach-loop.o \
./lib/pin2.14/source/tools/Debugger/set-mode-tool.o \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches.o \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches_before_breakpoint.o \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches_before_breakpoint_and_set_xmm_reg.o \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches_for_ymmtest.o \
./lib/pin2.14/source/tools/Debugger/signal-catch.o \
./lib/pin2.14/source/tools/Debugger/simple-command-tool.o \
./lib/pin2.14/source/tools/Debugger/simple-pindb-asm-windows-ia32.o \
./lib/pin2.14/source/tools/Debugger/simple-pindb-asm-windows-intel64.o \
./lib/pin2.14/source/tools/Debugger/simple-pindb.o \
./lib/pin2.14/source/tools/Debugger/simple.o \
./lib/pin2.14/source/tools/Debugger/simultaneous-toolbreak.o \
./lib/pin2.14/source/tools/Debugger/sleep-unix.o \
./lib/pin2.14/source/tools/Debugger/start-fini-callback.o \
./lib/pin2.14/source/tools/Debugger/stop-resume-when-suspended.o \
./lib/pin2.14/source/tools/Debugger/thread-unix.o \
./lib/pin2.14/source/tools/Debugger/thread-win.o \
./lib/pin2.14/source/tools/Debugger/thread.o \
./lib/pin2.14/source/tools/Debugger/use-debugger-shell.o \
./lib/pin2.14/source/tools/Debugger/watchpoint-app.o \
./lib/pin2.14/source/tools/Debugger/watchpoint.o \
./lib/pin2.14/source/tools/Debugger/win-continued-exception1.o \
./lib/pin2.14/source/tools/Debugger/win-continued-exception2.o \
./lib/pin2.14/source/tools/Debugger/win-cpp-exception.o \
./lib/pin2.14/source/tools/Debugger/win-foo-library.o \
./lib/pin2.14/source/tools/Debugger/win-handled-exception.o \
./lib/pin2.14/source/tools/Debugger/win-load-library.o \
./lib/pin2.14/source/tools/Debugger/win-software-exception.o \
./lib/pin2.14/source/tools/Debugger/win-thread-stress.o \
./lib/pin2.14/source/tools/Debugger/win-unhandled-exception.o \
./lib/pin2.14/source/tools/Debugger/xmm.o \
./lib/pin2.14/source/tools/Debugger/ymm.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Debugger/action-pending-app.d \
./lib/pin2.14/source/tools/Debugger/action-pending-tool.d \
./lib/pin2.14/source/tools/Debugger/app-pause-app.d \
./lib/pin2.14/source/tools/Debugger/app-pause-in-app-thread-tool.d \
./lib/pin2.14/source/tools/Debugger/app-pause-in-int-thread-tool.d \
./lib/pin2.14/source/tools/Debugger/bphandler.d \
./lib/pin2.14/source/tools/Debugger/bptest.d \
./lib/pin2.14/source/tools/Debugger/breaktool.d \
./lib/pin2.14/source/tools/Debugger/check-if-thread-stopped.d \
./lib/pin2.14/source/tools/Debugger/checkpoint.d \
./lib/pin2.14/source/tools/Debugger/debugger-shell-app.d \
./lib/pin2.14/source/tools/Debugger/debugger-type.d \
./lib/pin2.14/source/tools/Debugger/exec.d \
./lib/pin2.14/source/tools/Debugger/fork.d \
./lib/pin2.14/source/tools/Debugger/int3-count.d \
./lib/pin2.14/source/tools/Debugger/intercept-app.d \
./lib/pin2.14/source/tools/Debugger/intercept-tool.d \
./lib/pin2.14/source/tools/Debugger/interpreter-remove.d \
./lib/pin2.14/source/tools/Debugger/invalidate-regs.d \
./lib/pin2.14/source/tools/Debugger/launch-gdb-tool.d \
./lib/pin2.14/source/tools/Debugger/library-load-tool.d \
./lib/pin2.14/source/tools/Debugger/mt-exit-tool.d \
./lib/pin2.14/source/tools/Debugger/mt-exit.d \
./lib/pin2.14/source/tools/Debugger/null-emulator-ia32.d \
./lib/pin2.14/source/tools/Debugger/null-emulator-intel64.d \
./lib/pin2.14/source/tools/Debugger/pc-change-async-tool.d \
./lib/pin2.14/source/tools/Debugger/pc-change-async.d \
./lib/pin2.14/source/tools/Debugger/pc-change-bp.d \
./lib/pin2.14/source/tools/Debugger/pthread-bare-exit.d \
./lib/pin2.14/source/tools/Debugger/pthread-bare-exitgroup.d \
./lib/pin2.14/source/tools/Debugger/reattach-loop.d \
./lib/pin2.14/source/tools/Debugger/set-mode-tool.d \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches.d \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches_before_breakpoint.d \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches_before_breakpoint_and_set_xmm_reg.d \
./lib/pin2.14/source/tools/Debugger/set_xmm_scratches_for_ymmtest.d \
./lib/pin2.14/source/tools/Debugger/signal-catch.d \
./lib/pin2.14/source/tools/Debugger/simple-command-tool.d \
./lib/pin2.14/source/tools/Debugger/simple-pindb.d \
./lib/pin2.14/source/tools/Debugger/simultaneous-toolbreak.d \
./lib/pin2.14/source/tools/Debugger/start-fini-callback.d \
./lib/pin2.14/source/tools/Debugger/stop-resume-when-suspended.d \
./lib/pin2.14/source/tools/Debugger/thread-unix.d \
./lib/pin2.14/source/tools/Debugger/thread-win.d \
./lib/pin2.14/source/tools/Debugger/thread.d \
./lib/pin2.14/source/tools/Debugger/use-debugger-shell.d \
./lib/pin2.14/source/tools/Debugger/watchpoint.d \
./lib/pin2.14/source/tools/Debugger/win-continued-exception1.d \
./lib/pin2.14/source/tools/Debugger/win-continued-exception2.d \
./lib/pin2.14/source/tools/Debugger/win-cpp-exception.d \
./lib/pin2.14/source/tools/Debugger/win-foo-library.d \
./lib/pin2.14/source/tools/Debugger/win-handled-exception.d \
./lib/pin2.14/source/tools/Debugger/win-load-library.d \
./lib/pin2.14/source/tools/Debugger/win-software-exception.d \
./lib/pin2.14/source/tools/Debugger/win-thread-stress.d \
./lib/pin2.14/source/tools/Debugger/win-unhandled-exception.d \
./lib/pin2.14/source/tools/Debugger/ymm.d 

C_DEPS += \
./lib/pin2.14/source/tools/Debugger/bphandler_app.d \
./lib/pin2.14/source/tools/Debugger/callerapp.d \
./lib/pin2.14/source/tools/Debugger/checkpoint-app.d \
./lib/pin2.14/source/tools/Debugger/dlopen-dlclose.d \
./lib/pin2.14/source/tools/Debugger/pick-random-port.d \
./lib/pin2.14/source/tools/Debugger/simple.d \
./lib/pin2.14/source/tools/Debugger/sleep-unix.d \
./lib/pin2.14/source/tools/Debugger/watchpoint-app.d \
./lib/pin2.14/source/tools/Debugger/xmm.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Debugger/%.o: ../lib/pin2.14/source/tools/Debugger/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Debugger/%.o: ../lib/pin2.14/source/tools/Debugger/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Debugger/%.o: ../lib/pin2.14/source/tools/Debugger/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


