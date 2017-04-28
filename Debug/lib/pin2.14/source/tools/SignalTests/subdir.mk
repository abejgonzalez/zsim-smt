################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/pin2.14/source/tools/SignalTests/action-pending.cpp \
../lib/pin2.14/source/tools/SignalTests/async_multithreadingtool.cpp \
../lib/pin2.14/source/tools/SignalTests/call-app-stress-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/call-app-stress.cpp \
../lib/pin2.14/source/tools/SignalTests/call-app-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/call-app.cpp \
../lib/pin2.14/source/tools/SignalTests/deprecated-intercept.cpp \
../lib/pin2.14/source/tools/SignalTests/exittool.cpp \
../lib/pin2.14/source/tools/SignalTests/fastsigchecktool.cpp \
../lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool1.cpp \
../lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool2.cpp \
../lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool3.cpp \
../lib/pin2.14/source/tools/SignalTests/faulttool.cpp \
../lib/pin2.14/source/tools/SignalTests/handlerAlignment.cpp \
../lib/pin2.14/source/tools/SignalTests/insfault-linux-intel64.cpp \
../lib/pin2.14/source/tools/SignalTests/insfault.cpp \
../lib/pin2.14/source/tools/SignalTests/inst-type-app.cpp \
../lib/pin2.14/source/tools/SignalTests/inst-type-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/interceptall.cpp \
../lib/pin2.14/source/tools/SignalTests/interceptor_for_regbindings_cache_test.cpp \
../lib/pin2.14/source/tools/SignalTests/interceptsegv.cpp \
../lib/pin2.14/source/tools/SignalTests/intercepttool.cpp \
../lib/pin2.14/source/tools/SignalTests/logtool.cpp \
../lib/pin2.14/source/tools/SignalTests/mtstress.cpp \
../lib/pin2.14/source/tools/SignalTests/null-rewrite-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/raise-exception-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/reg-pressure-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/replay-signal-tool.cpp \
../lib/pin2.14/source/tools/SignalTests/reporter.cpp \
../lib/pin2.14/source/tools/SignalTests/resetsegv-safecopy.cpp \
../lib/pin2.14/source/tools/SignalTests/sig64.cpp \
../lib/pin2.14/source/tools/SignalTests/sigenable.cpp \
../lib/pin2.14/source/tools/SignalTests/sigflowcheck.cpp \
../lib/pin2.14/source/tools/SignalTests/sigprocmask_short.cpp \
../lib/pin2.14/source/tools/SignalTests/spilltool.cpp \
../lib/pin2.14/source/tools/SignalTests/syncasynctool.cpp \
../lib/pin2.14/source/tools/SignalTests/then-stress-app.cpp \
../lib/pin2.14/source/tools/SignalTests/then-stress-tool.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/SignalTests/altstack.c \
../lib/pin2.14/source/tools/SignalTests/async_multithreadingapp.c \
../lib/pin2.14/source/tools/SignalTests/asyncfpe.c \
../lib/pin2.14/source/tools/SignalTests/bad-stack.c \
../lib/pin2.14/source/tools/SignalTests/blockingsyscall.c \
../lib/pin2.14/source/tools/SignalTests/blockloop.c \
../lib/pin2.14/source/tools/SignalTests/dfcheck.c \
../lib/pin2.14/source/tools/SignalTests/double.c \
../lib/pin2.14/source/tools/SignalTests/efault.c \
../lib/pin2.14/source/tools/SignalTests/errcheck.c \
../lib/pin2.14/source/tools/SignalTests/exithandler.c \
../lib/pin2.14/source/tools/SignalTests/fatal.c \
../lib/pin2.14/source/tools/SignalTests/fatal_block_sync.c \
../lib/pin2.14/source/tools/SignalTests/fatalsync.c \
../lib/pin2.14/source/tools/SignalTests/faultcheck-x86.c \
../lib/pin2.14/source/tools/SignalTests/faultcheck.c \
../lib/pin2.14/source/tools/SignalTests/faultcheck_flags.c \
../lib/pin2.14/source/tools/SignalTests/forktest_altstack.c \
../lib/pin2.14/source/tools/SignalTests/fpcheck.c \
../lib/pin2.14/source/tools/SignalTests/fptags.c \
../lib/pin2.14/source/tools/SignalTests/futex.c \
../lib/pin2.14/source/tools/SignalTests/handle-usr1.c \
../lib/pin2.14/source/tools/SignalTests/hlt.c \
../lib/pin2.14/source/tools/SignalTests/maskcheck.c \
../lib/pin2.14/source/tools/SignalTests/movsbtest.c \
../lib/pin2.14/source/tools/SignalTests/nestmask.c \
../lib/pin2.14/source/tools/SignalTests/recursive.c \
../lib/pin2.14/source/tools/SignalTests/regbindings_cache_test_checker.c \
../lib/pin2.14/source/tools/SignalTests/replay-signal-app.c \
../lib/pin2.14/source/tools/SignalTests/resetcont.c \
../lib/pin2.14/source/tools/SignalTests/resetsegv.c \
../lib/pin2.14/source/tools/SignalTests/segv.c \
../lib/pin2.14/source/tools/SignalTests/segv_for_regbindings_cache_test.c \
../lib/pin2.14/source/tools/SignalTests/segv_on_fetch.c \
../lib/pin2.14/source/tools/SignalTests/setcontext.c \
../lib/pin2.14/source/tools/SignalTests/shortmask.c \
../lib/pin2.14/source/tools/SignalTests/sigaltstack.c \
../lib/pin2.14/source/tools/SignalTests/sigcont.c \
../lib/pin2.14/source/tools/SignalTests/sigenableapp.c \
../lib/pin2.14/source/tools/SignalTests/sigenableapp2.c \
../lib/pin2.14/source/tools/SignalTests/sigsuspend.c \
../lib/pin2.14/source/tools/SignalTests/sigusr2.c \
../lib/pin2.14/source/tools/SignalTests/simple.c \
../lib/pin2.14/source/tools/SignalTests/suspendmask.c \
../lib/pin2.14/source/tools/SignalTests/syncasyncapp.c \
../lib/pin2.14/source/tools/SignalTests/threadtest_altstack.c \
../lib/pin2.14/source/tools/SignalTests/xmmcheck.c \
../lib/pin2.14/source/tools/SignalTests/xmmfaultcheck.c 

OBJS += \
./lib/pin2.14/source/tools/SignalTests/action-pending.o \
./lib/pin2.14/source/tools/SignalTests/altstack.o \
./lib/pin2.14/source/tools/SignalTests/async_multithreadingapp.o \
./lib/pin2.14/source/tools/SignalTests/async_multithreadingtool.o \
./lib/pin2.14/source/tools/SignalTests/asyncfpe.o \
./lib/pin2.14/source/tools/SignalTests/bad-stack.o \
./lib/pin2.14/source/tools/SignalTests/blockingsyscall.o \
./lib/pin2.14/source/tools/SignalTests/blockloop.o \
./lib/pin2.14/source/tools/SignalTests/call-app-stress-tool.o \
./lib/pin2.14/source/tools/SignalTests/call-app-stress.o \
./lib/pin2.14/source/tools/SignalTests/call-app-tool.o \
./lib/pin2.14/source/tools/SignalTests/call-app.o \
./lib/pin2.14/source/tools/SignalTests/deprecated-intercept.o \
./lib/pin2.14/source/tools/SignalTests/dfcheck.o \
./lib/pin2.14/source/tools/SignalTests/double.o \
./lib/pin2.14/source/tools/SignalTests/efault.o \
./lib/pin2.14/source/tools/SignalTests/errcheck.o \
./lib/pin2.14/source/tools/SignalTests/exithandler.o \
./lib/pin2.14/source/tools/SignalTests/exittool.o \
./lib/pin2.14/source/tools/SignalTests/fastsigchecktool.o \
./lib/pin2.14/source/tools/SignalTests/fatal.o \
./lib/pin2.14/source/tools/SignalTests/fatal_block_sync.o \
./lib/pin2.14/source/tools/SignalTests/fatalsync.o \
./lib/pin2.14/source/tools/SignalTests/faultcheck-x86.o \
./lib/pin2.14/source/tools/SignalTests/faultcheck.o \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags.o \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool1.o \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool2.o \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool3.o \
./lib/pin2.14/source/tools/SignalTests/faulttool.o \
./lib/pin2.14/source/tools/SignalTests/forktest_altstack.o \
./lib/pin2.14/source/tools/SignalTests/fpcheck.o \
./lib/pin2.14/source/tools/SignalTests/fptags.o \
./lib/pin2.14/source/tools/SignalTests/futex.o \
./lib/pin2.14/source/tools/SignalTests/handle-usr1.o \
./lib/pin2.14/source/tools/SignalTests/handlerAlignment.o \
./lib/pin2.14/source/tools/SignalTests/hlt.o \
./lib/pin2.14/source/tools/SignalTests/insfault-linux-intel64.o \
./lib/pin2.14/source/tools/SignalTests/insfault.o \
./lib/pin2.14/source/tools/SignalTests/inst-type-app.o \
./lib/pin2.14/source/tools/SignalTests/inst-type-tool.o \
./lib/pin2.14/source/tools/SignalTests/interceptall.o \
./lib/pin2.14/source/tools/SignalTests/interceptor_for_regbindings_cache_test.o \
./lib/pin2.14/source/tools/SignalTests/interceptsegv.o \
./lib/pin2.14/source/tools/SignalTests/intercepttool.o \
./lib/pin2.14/source/tools/SignalTests/logtool.o \
./lib/pin2.14/source/tools/SignalTests/maskcheck.o \
./lib/pin2.14/source/tools/SignalTests/movsbtest.o \
./lib/pin2.14/source/tools/SignalTests/mtstress.o \
./lib/pin2.14/source/tools/SignalTests/nestmask.o \
./lib/pin2.14/source/tools/SignalTests/null-rewrite-tool.o \
./lib/pin2.14/source/tools/SignalTests/raise-exception-tool.o \
./lib/pin2.14/source/tools/SignalTests/recursive.o \
./lib/pin2.14/source/tools/SignalTests/reg-pressure-tool.o \
./lib/pin2.14/source/tools/SignalTests/regbindings_cache_test_checker.o \
./lib/pin2.14/source/tools/SignalTests/replay-signal-app.o \
./lib/pin2.14/source/tools/SignalTests/replay-signal-tool.o \
./lib/pin2.14/source/tools/SignalTests/reporter.o \
./lib/pin2.14/source/tools/SignalTests/resetcont.o \
./lib/pin2.14/source/tools/SignalTests/resetsegv-safecopy.o \
./lib/pin2.14/source/tools/SignalTests/resetsegv.o \
./lib/pin2.14/source/tools/SignalTests/segv.o \
./lib/pin2.14/source/tools/SignalTests/segv_for_regbindings_cache_test.o \
./lib/pin2.14/source/tools/SignalTests/segv_on_fetch.o \
./lib/pin2.14/source/tools/SignalTests/setcontext.o \
./lib/pin2.14/source/tools/SignalTests/shortmask.o \
./lib/pin2.14/source/tools/SignalTests/sig64.o \
./lib/pin2.14/source/tools/SignalTests/sigaltstack.o \
./lib/pin2.14/source/tools/SignalTests/sigcont.o \
./lib/pin2.14/source/tools/SignalTests/sigenable.o \
./lib/pin2.14/source/tools/SignalTests/sigenableapp.o \
./lib/pin2.14/source/tools/SignalTests/sigenableapp2.o \
./lib/pin2.14/source/tools/SignalTests/sigflowcheck.o \
./lib/pin2.14/source/tools/SignalTests/sigprocmask_short.o \
./lib/pin2.14/source/tools/SignalTests/sigsuspend.o \
./lib/pin2.14/source/tools/SignalTests/sigusr2.o \
./lib/pin2.14/source/tools/SignalTests/simple.o \
./lib/pin2.14/source/tools/SignalTests/spilltool.o \
./lib/pin2.14/source/tools/SignalTests/suspendmask.o \
./lib/pin2.14/source/tools/SignalTests/syncasyncapp.o \
./lib/pin2.14/source/tools/SignalTests/syncasynctool.o \
./lib/pin2.14/source/tools/SignalTests/then-stress-app.o \
./lib/pin2.14/source/tools/SignalTests/then-stress-tool.o \
./lib/pin2.14/source/tools/SignalTests/threadtest_altstack.o \
./lib/pin2.14/source/tools/SignalTests/xmmcheck.o \
./lib/pin2.14/source/tools/SignalTests/xmmfaultcheck.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/SignalTests/action-pending.d \
./lib/pin2.14/source/tools/SignalTests/async_multithreadingtool.d \
./lib/pin2.14/source/tools/SignalTests/call-app-stress-tool.d \
./lib/pin2.14/source/tools/SignalTests/call-app-stress.d \
./lib/pin2.14/source/tools/SignalTests/call-app-tool.d \
./lib/pin2.14/source/tools/SignalTests/call-app.d \
./lib/pin2.14/source/tools/SignalTests/deprecated-intercept.d \
./lib/pin2.14/source/tools/SignalTests/exittool.d \
./lib/pin2.14/source/tools/SignalTests/fastsigchecktool.d \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool1.d \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool2.d \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags_tool3.d \
./lib/pin2.14/source/tools/SignalTests/faulttool.d \
./lib/pin2.14/source/tools/SignalTests/handlerAlignment.d \
./lib/pin2.14/source/tools/SignalTests/insfault-linux-intel64.d \
./lib/pin2.14/source/tools/SignalTests/insfault.d \
./lib/pin2.14/source/tools/SignalTests/inst-type-app.d \
./lib/pin2.14/source/tools/SignalTests/inst-type-tool.d \
./lib/pin2.14/source/tools/SignalTests/interceptall.d \
./lib/pin2.14/source/tools/SignalTests/interceptor_for_regbindings_cache_test.d \
./lib/pin2.14/source/tools/SignalTests/interceptsegv.d \
./lib/pin2.14/source/tools/SignalTests/intercepttool.d \
./lib/pin2.14/source/tools/SignalTests/logtool.d \
./lib/pin2.14/source/tools/SignalTests/mtstress.d \
./lib/pin2.14/source/tools/SignalTests/null-rewrite-tool.d \
./lib/pin2.14/source/tools/SignalTests/raise-exception-tool.d \
./lib/pin2.14/source/tools/SignalTests/reg-pressure-tool.d \
./lib/pin2.14/source/tools/SignalTests/replay-signal-tool.d \
./lib/pin2.14/source/tools/SignalTests/reporter.d \
./lib/pin2.14/source/tools/SignalTests/resetsegv-safecopy.d \
./lib/pin2.14/source/tools/SignalTests/sig64.d \
./lib/pin2.14/source/tools/SignalTests/sigenable.d \
./lib/pin2.14/source/tools/SignalTests/sigflowcheck.d \
./lib/pin2.14/source/tools/SignalTests/sigprocmask_short.d \
./lib/pin2.14/source/tools/SignalTests/spilltool.d \
./lib/pin2.14/source/tools/SignalTests/syncasynctool.d \
./lib/pin2.14/source/tools/SignalTests/then-stress-app.d \
./lib/pin2.14/source/tools/SignalTests/then-stress-tool.d 

C_DEPS += \
./lib/pin2.14/source/tools/SignalTests/altstack.d \
./lib/pin2.14/source/tools/SignalTests/async_multithreadingapp.d \
./lib/pin2.14/source/tools/SignalTests/asyncfpe.d \
./lib/pin2.14/source/tools/SignalTests/bad-stack.d \
./lib/pin2.14/source/tools/SignalTests/blockingsyscall.d \
./lib/pin2.14/source/tools/SignalTests/blockloop.d \
./lib/pin2.14/source/tools/SignalTests/dfcheck.d \
./lib/pin2.14/source/tools/SignalTests/double.d \
./lib/pin2.14/source/tools/SignalTests/efault.d \
./lib/pin2.14/source/tools/SignalTests/errcheck.d \
./lib/pin2.14/source/tools/SignalTests/exithandler.d \
./lib/pin2.14/source/tools/SignalTests/fatal.d \
./lib/pin2.14/source/tools/SignalTests/fatal_block_sync.d \
./lib/pin2.14/source/tools/SignalTests/fatalsync.d \
./lib/pin2.14/source/tools/SignalTests/faultcheck-x86.d \
./lib/pin2.14/source/tools/SignalTests/faultcheck.d \
./lib/pin2.14/source/tools/SignalTests/faultcheck_flags.d \
./lib/pin2.14/source/tools/SignalTests/forktest_altstack.d \
./lib/pin2.14/source/tools/SignalTests/fpcheck.d \
./lib/pin2.14/source/tools/SignalTests/fptags.d \
./lib/pin2.14/source/tools/SignalTests/futex.d \
./lib/pin2.14/source/tools/SignalTests/handle-usr1.d \
./lib/pin2.14/source/tools/SignalTests/hlt.d \
./lib/pin2.14/source/tools/SignalTests/maskcheck.d \
./lib/pin2.14/source/tools/SignalTests/movsbtest.d \
./lib/pin2.14/source/tools/SignalTests/nestmask.d \
./lib/pin2.14/source/tools/SignalTests/recursive.d \
./lib/pin2.14/source/tools/SignalTests/regbindings_cache_test_checker.d \
./lib/pin2.14/source/tools/SignalTests/replay-signal-app.d \
./lib/pin2.14/source/tools/SignalTests/resetcont.d \
./lib/pin2.14/source/tools/SignalTests/resetsegv.d \
./lib/pin2.14/source/tools/SignalTests/segv.d \
./lib/pin2.14/source/tools/SignalTests/segv_for_regbindings_cache_test.d \
./lib/pin2.14/source/tools/SignalTests/segv_on_fetch.d \
./lib/pin2.14/source/tools/SignalTests/setcontext.d \
./lib/pin2.14/source/tools/SignalTests/shortmask.d \
./lib/pin2.14/source/tools/SignalTests/sigaltstack.d \
./lib/pin2.14/source/tools/SignalTests/sigcont.d \
./lib/pin2.14/source/tools/SignalTests/sigenableapp.d \
./lib/pin2.14/source/tools/SignalTests/sigenableapp2.d \
./lib/pin2.14/source/tools/SignalTests/sigsuspend.d \
./lib/pin2.14/source/tools/SignalTests/sigusr2.d \
./lib/pin2.14/source/tools/SignalTests/simple.d \
./lib/pin2.14/source/tools/SignalTests/suspendmask.d \
./lib/pin2.14/source/tools/SignalTests/syncasyncapp.d \
./lib/pin2.14/source/tools/SignalTests/threadtest_altstack.d \
./lib/pin2.14/source/tools/SignalTests/xmmcheck.d \
./lib/pin2.14/source/tools/SignalTests/xmmfaultcheck.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/SignalTests/%.o: ../lib/pin2.14/source/tools/SignalTests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/SignalTests/%.o: ../lib/pin2.14/source/tools/SignalTests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


