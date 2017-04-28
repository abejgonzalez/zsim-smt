################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../lib/pin2.14/source/tools/Tests/jecxz_ia32.asm \
../lib/pin2.14/source/tools/Tests/jecxz_intel64.asm \
../lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_ia32_win.asm 

CPP_SRCS += \
../lib/pin2.14/source/tools/Tests/IARGList.cpp \
../lib/pin2.14/source/tools/Tests/after.cpp \
../lib/pin2.14/source/tools/Tests/alah.cpp \
../lib/pin2.14/source/tools/Tests/bblCache.cpp \
../lib/pin2.14/source/tools/Tests/bblFallThrough.cpp \
../lib/pin2.14/source/tools/Tests/bblnull.cpp \
../lib/pin2.14/source/tools/Tests/brtaken.cpp \
../lib/pin2.14/source/tools/Tests/callargs.cpp \
../lib/pin2.14/source/tools/Tests/callargs_probe_tool.cpp \
../lib/pin2.14/source/tools/Tests/cflowcheck.cpp \
../lib/pin2.14/source/tools/Tests/check_env.cpp \
../lib/pin2.14/source/tools/Tests/checkaddress.cpp \
../lib/pin2.14/source/tools/Tests/clear_df_flag_tool.cpp \
../lib/pin2.14/source/tools/Tests/const_context_at_ins.cpp \
../lib/pin2.14/source/tools/Tests/context-pc.cpp \
../lib/pin2.14/source/tools/Tests/context.cpp \
../lib/pin2.14/source/tools/Tests/context_stack_and_spill.cpp \
../lib/pin2.14/source/tools/Tests/correct_winapp_runs_pin_cmdline.cpp \
../lib/pin2.14/source/tools/Tests/detach.cpp \
../lib/pin2.14/source/tools/Tests/ea_verifier.cpp \
../lib/pin2.14/source/tools/Tests/emu.cpp \
../lib/pin2.14/source/tools/Tests/exitProcess.cpp \
../lib/pin2.14/source/tools/Tests/finiRemove.cpp \
../lib/pin2.14/source/tools/Tests/hello.cpp \
../lib/pin2.14/source/tools/Tests/icount1.cpp \
../lib/pin2.14/source/tools/Tests/icount2.cpp \
../lib/pin2.14/source/tools/Tests/icount3.cpp \
../lib/pin2.14/source/tools/Tests/icount4.cpp \
../lib/pin2.14/source/tools/Tests/icount5.cpp \
../lib/pin2.14/source/tools/Tests/icountcheck.cpp \
../lib/pin2.14/source/tools/Tests/ifunc_tst.cpp \
../lib/pin2.14/source/tools/Tests/ifuncmemcpy.cpp \
../lib/pin2.14/source/tools/Tests/imageLoad.cpp \
../lib/pin2.14/source/tools/Tests/imageLoadBackward.cpp \
../lib/pin2.14/source/tools/Tests/insMix.cpp \
../lib/pin2.14/source/tools/Tests/inscount2_mt_debuginfo.cpp \
../lib/pin2.14/source/tools/Tests/inscount_per_image.cpp \
../lib/pin2.14/source/tools/Tests/lasterror.cpp \
../lib/pin2.14/source/tools/Tests/launcher_app.cpp \
../lib/pin2.14/source/tools/Tests/launcher_tool.cpp \
../lib/pin2.14/source/tools/Tests/limitedTraces.cpp \
../lib/pin2.14/source/tools/Tests/malloc.cpp \
../lib/pin2.14/source/tools/Tests/memident.cpp \
../lib/pin2.14/source/tools/Tests/mtest.cpp \
../lib/pin2.14/source/tools/Tests/multipleinstrumentation.cpp \
../lib/pin2.14/source/tools/Tests/new.cpp \
../lib/pin2.14/source/tools/Tests/operand.cpp \
../lib/pin2.14/source/tools/Tests/parse_executed_rtns.cpp \
../lib/pin2.14/source/tools/Tests/prefix.cpp \
../lib/pin2.14/source/tools/Tests/probe.cpp \
../lib/pin2.14/source/tools/Tests/reg.cpp \
../lib/pin2.14/source/tools/Tests/reg_ref_inlined.cpp \
../lib/pin2.14/source/tools/Tests/removeinstrumentation.cpp \
../lib/pin2.14/source/tools/Tests/rep_ip_at_ipoint_after_tool.cpp \
../lib/pin2.14/source/tools/Tests/rtnNumIns.cpp \
../lib/pin2.14/source/tools/Tests/rtn_create_at_dup.cpp \
../lib/pin2.14/source/tools/Tests/rtn_insert_call_probed.cpp \
../lib/pin2.14/source/tools/Tests/sec.cpp \
../lib/pin2.14/source/tools/Tests/segv.cpp \
../lib/pin2.14/source/tools/Tests/sequence.cpp \
../lib/pin2.14/source/tools/Tests/sequencecheck.cpp \
../lib/pin2.14/source/tools/Tests/set_df_flag_tool.cpp \
../lib/pin2.14/source/tools/Tests/set_status_flags_tool.cpp \
../lib/pin2.14/source/tools/Tests/smc_check.cpp \
../lib/pin2.14/source/tools/Tests/snprintf.cpp \
../lib/pin2.14/source/tools/Tests/sourceLocation_app.cpp \
../lib/pin2.14/source/tools/Tests/sourceLocation_img1.cpp \
../lib/pin2.14/source/tools/Tests/sourceLocation_img2.cpp \
../lib/pin2.14/source/tools/Tests/sourceLocation_tool.cpp \
../lib/pin2.14/source/tools/Tests/statdyn_app.cpp \
../lib/pin2.14/source/tools/Tests/statdyn_tool.cpp \
../lib/pin2.14/source/tools/Tests/swizzle1.cpp \
../lib/pin2.14/source/tools/Tests/symOutOfBound.cpp \
../lib/pin2.14/source/tools/Tests/syntax.cpp \
../lib/pin2.14/source/tools/Tests/syntax_tst.cpp \
../lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_unix.cpp \
../lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_win.cpp \
../lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_xed_interface.cpp \
../lib/pin2.14/source/tools/Tests/thread.cpp \
../lib/pin2.14/source/tools/Tests/threadApp.cpp \
../lib/pin2.14/source/tools/Tests/traceOriginal.cpp \
../lib/pin2.14/source/tools/Tests/tracecount.cpp \
../lib/pin2.14/source/tools/Tests/traceusage.cpp \
../lib/pin2.14/source/tools/Tests/util.cpp \
../lib/pin2.14/source/tools/Tests/verify.cpp \
../lib/pin2.14/source/tools/Tests/win_cvapp_test_tool.cpp \
../lib/pin2.14/source/tools/Tests/winapp_runs_pin.cpp \
../lib/pin2.14/source/tools/Tests/xedReg.cpp 

C_SRCS += \
../lib/pin2.14/source/tools/Tests/child_sig_while_execv_app.c \
../lib/pin2.14/source/tools/Tests/child_sig_while_execv_simple_app.c \
../lib/pin2.14/source/tools/Tests/exitProcessApp.c \
../lib/pin2.14/source/tools/Tests/foobar.c \
../lib/pin2.14/source/tools/Tests/illegalEnvp_app.c \
../lib/pin2.14/source/tools/Tests/int3test.c \
../lib/pin2.14/source/tools/Tests/memcpy_app.c \
../lib/pin2.14/source/tools/Tests/mysetenv.c \
../lib/pin2.14/source/tools/Tests/rep_ip_at_ipoint_after_app.c \
../lib/pin2.14/source/tools/Tests/smc_test_l.c \
../lib/pin2.14/source/tools/Tests/strcmp_app.c 

OBJS += \
./lib/pin2.14/source/tools/Tests/IARGList.o \
./lib/pin2.14/source/tools/Tests/after.o \
./lib/pin2.14/source/tools/Tests/alah.o \
./lib/pin2.14/source/tools/Tests/bblCache.o \
./lib/pin2.14/source/tools/Tests/bblFallThrough.o \
./lib/pin2.14/source/tools/Tests/bblnull.o \
./lib/pin2.14/source/tools/Tests/brtaken.o \
./lib/pin2.14/source/tools/Tests/callargs.o \
./lib/pin2.14/source/tools/Tests/callargs_probe_tool.o \
./lib/pin2.14/source/tools/Tests/cflowcheck.o \
./lib/pin2.14/source/tools/Tests/check_env.o \
./lib/pin2.14/source/tools/Tests/checkaddress.o \
./lib/pin2.14/source/tools/Tests/child_sig_while_execv_app.o \
./lib/pin2.14/source/tools/Tests/child_sig_while_execv_simple_app.o \
./lib/pin2.14/source/tools/Tests/clear_df_flag_tool.o \
./lib/pin2.14/source/tools/Tests/const_context_at_ins.o \
./lib/pin2.14/source/tools/Tests/context-pc.o \
./lib/pin2.14/source/tools/Tests/context.o \
./lib/pin2.14/source/tools/Tests/context_stack_and_spill.o \
./lib/pin2.14/source/tools/Tests/correct_winapp_runs_pin_cmdline.o \
./lib/pin2.14/source/tools/Tests/detach.o \
./lib/pin2.14/source/tools/Tests/ea_verifier.o \
./lib/pin2.14/source/tools/Tests/emu.o \
./lib/pin2.14/source/tools/Tests/exitProcess.o \
./lib/pin2.14/source/tools/Tests/exitProcessApp.o \
./lib/pin2.14/source/tools/Tests/finiRemove.o \
./lib/pin2.14/source/tools/Tests/foobar.o \
./lib/pin2.14/source/tools/Tests/hello.o \
./lib/pin2.14/source/tools/Tests/icount1.o \
./lib/pin2.14/source/tools/Tests/icount2.o \
./lib/pin2.14/source/tools/Tests/icount3.o \
./lib/pin2.14/source/tools/Tests/icount4.o \
./lib/pin2.14/source/tools/Tests/icount5.o \
./lib/pin2.14/source/tools/Tests/icountcheck.o \
./lib/pin2.14/source/tools/Tests/ifunc_tst.o \
./lib/pin2.14/source/tools/Tests/ifuncmemcpy.o \
./lib/pin2.14/source/tools/Tests/illegalEnvp_app.o \
./lib/pin2.14/source/tools/Tests/imageLoad.o \
./lib/pin2.14/source/tools/Tests/imageLoadBackward.o \
./lib/pin2.14/source/tools/Tests/insMix.o \
./lib/pin2.14/source/tools/Tests/inscount2_mt_debuginfo.o \
./lib/pin2.14/source/tools/Tests/inscount_per_image.o \
./lib/pin2.14/source/tools/Tests/int3test.o \
./lib/pin2.14/source/tools/Tests/jecxz_ia32.o \
./lib/pin2.14/source/tools/Tests/jecxz_intel64.o \
./lib/pin2.14/source/tools/Tests/lasterror.o \
./lib/pin2.14/source/tools/Tests/launcher_app.o \
./lib/pin2.14/source/tools/Tests/launcher_tool.o \
./lib/pin2.14/source/tools/Tests/limitedTraces.o \
./lib/pin2.14/source/tools/Tests/malloc.o \
./lib/pin2.14/source/tools/Tests/memcpy_app.o \
./lib/pin2.14/source/tools/Tests/memident.o \
./lib/pin2.14/source/tools/Tests/mtest.o \
./lib/pin2.14/source/tools/Tests/multipleinstrumentation.o \
./lib/pin2.14/source/tools/Tests/mysetenv.o \
./lib/pin2.14/source/tools/Tests/new.o \
./lib/pin2.14/source/tools/Tests/operand.o \
./lib/pin2.14/source/tools/Tests/parse_executed_rtns.o \
./lib/pin2.14/source/tools/Tests/prefix.o \
./lib/pin2.14/source/tools/Tests/probe.o \
./lib/pin2.14/source/tools/Tests/reg.o \
./lib/pin2.14/source/tools/Tests/reg_ref_inlined.o \
./lib/pin2.14/source/tools/Tests/removeinstrumentation.o \
./lib/pin2.14/source/tools/Tests/rep_ip_at_ipoint_after_app.o \
./lib/pin2.14/source/tools/Tests/rep_ip_at_ipoint_after_tool.o \
./lib/pin2.14/source/tools/Tests/rtnNumIns.o \
./lib/pin2.14/source/tools/Tests/rtn_create_at_dup.o \
./lib/pin2.14/source/tools/Tests/rtn_insert_call_probed.o \
./lib/pin2.14/source/tools/Tests/sec.o \
./lib/pin2.14/source/tools/Tests/segv.o \
./lib/pin2.14/source/tools/Tests/sequence.o \
./lib/pin2.14/source/tools/Tests/sequencecheck.o \
./lib/pin2.14/source/tools/Tests/set_df_flag_tool.o \
./lib/pin2.14/source/tools/Tests/set_status_flags_tool.o \
./lib/pin2.14/source/tools/Tests/smc_check.o \
./lib/pin2.14/source/tools/Tests/smc_test_l.o \
./lib/pin2.14/source/tools/Tests/snprintf.o \
./lib/pin2.14/source/tools/Tests/sourceLocation_app.o \
./lib/pin2.14/source/tools/Tests/sourceLocation_img1.o \
./lib/pin2.14/source/tools/Tests/sourceLocation_img2.o \
./lib/pin2.14/source/tools/Tests/sourceLocation_tool.o \
./lib/pin2.14/source/tools/Tests/statdyn_app.o \
./lib/pin2.14/source/tools/Tests/statdyn_tool.o \
./lib/pin2.14/source/tools/Tests/strcmp_app.o \
./lib/pin2.14/source/tools/Tests/swizzle1.o \
./lib/pin2.14/source/tools/Tests/symOutOfBound.o \
./lib/pin2.14/source/tools/Tests/syntax.o \
./lib/pin2.14/source/tools/Tests/syntax_tst.o \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_ia32_win.o \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_unix.o \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_win.o \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_xed_interface.o \
./lib/pin2.14/source/tools/Tests/thread.o \
./lib/pin2.14/source/tools/Tests/threadApp.o \
./lib/pin2.14/source/tools/Tests/traceOriginal.o \
./lib/pin2.14/source/tools/Tests/tracecount.o \
./lib/pin2.14/source/tools/Tests/traceusage.o \
./lib/pin2.14/source/tools/Tests/util.o \
./lib/pin2.14/source/tools/Tests/verify.o \
./lib/pin2.14/source/tools/Tests/win_cvapp_test_tool.o \
./lib/pin2.14/source/tools/Tests/winapp_runs_pin.o \
./lib/pin2.14/source/tools/Tests/xedReg.o 

CPP_DEPS += \
./lib/pin2.14/source/tools/Tests/IARGList.d \
./lib/pin2.14/source/tools/Tests/after.d \
./lib/pin2.14/source/tools/Tests/alah.d \
./lib/pin2.14/source/tools/Tests/bblCache.d \
./lib/pin2.14/source/tools/Tests/bblFallThrough.d \
./lib/pin2.14/source/tools/Tests/bblnull.d \
./lib/pin2.14/source/tools/Tests/brtaken.d \
./lib/pin2.14/source/tools/Tests/callargs.d \
./lib/pin2.14/source/tools/Tests/callargs_probe_tool.d \
./lib/pin2.14/source/tools/Tests/cflowcheck.d \
./lib/pin2.14/source/tools/Tests/check_env.d \
./lib/pin2.14/source/tools/Tests/checkaddress.d \
./lib/pin2.14/source/tools/Tests/clear_df_flag_tool.d \
./lib/pin2.14/source/tools/Tests/const_context_at_ins.d \
./lib/pin2.14/source/tools/Tests/context-pc.d \
./lib/pin2.14/source/tools/Tests/context.d \
./lib/pin2.14/source/tools/Tests/context_stack_and_spill.d \
./lib/pin2.14/source/tools/Tests/correct_winapp_runs_pin_cmdline.d \
./lib/pin2.14/source/tools/Tests/detach.d \
./lib/pin2.14/source/tools/Tests/ea_verifier.d \
./lib/pin2.14/source/tools/Tests/emu.d \
./lib/pin2.14/source/tools/Tests/exitProcess.d \
./lib/pin2.14/source/tools/Tests/finiRemove.d \
./lib/pin2.14/source/tools/Tests/hello.d \
./lib/pin2.14/source/tools/Tests/icount1.d \
./lib/pin2.14/source/tools/Tests/icount2.d \
./lib/pin2.14/source/tools/Tests/icount3.d \
./lib/pin2.14/source/tools/Tests/icount4.d \
./lib/pin2.14/source/tools/Tests/icount5.d \
./lib/pin2.14/source/tools/Tests/icountcheck.d \
./lib/pin2.14/source/tools/Tests/ifunc_tst.d \
./lib/pin2.14/source/tools/Tests/ifuncmemcpy.d \
./lib/pin2.14/source/tools/Tests/imageLoad.d \
./lib/pin2.14/source/tools/Tests/imageLoadBackward.d \
./lib/pin2.14/source/tools/Tests/insMix.d \
./lib/pin2.14/source/tools/Tests/inscount2_mt_debuginfo.d \
./lib/pin2.14/source/tools/Tests/inscount_per_image.d \
./lib/pin2.14/source/tools/Tests/lasterror.d \
./lib/pin2.14/source/tools/Tests/launcher_app.d \
./lib/pin2.14/source/tools/Tests/launcher_tool.d \
./lib/pin2.14/source/tools/Tests/limitedTraces.d \
./lib/pin2.14/source/tools/Tests/malloc.d \
./lib/pin2.14/source/tools/Tests/memident.d \
./lib/pin2.14/source/tools/Tests/mtest.d \
./lib/pin2.14/source/tools/Tests/multipleinstrumentation.d \
./lib/pin2.14/source/tools/Tests/new.d \
./lib/pin2.14/source/tools/Tests/operand.d \
./lib/pin2.14/source/tools/Tests/parse_executed_rtns.d \
./lib/pin2.14/source/tools/Tests/prefix.d \
./lib/pin2.14/source/tools/Tests/probe.d \
./lib/pin2.14/source/tools/Tests/reg.d \
./lib/pin2.14/source/tools/Tests/reg_ref_inlined.d \
./lib/pin2.14/source/tools/Tests/removeinstrumentation.d \
./lib/pin2.14/source/tools/Tests/rep_ip_at_ipoint_after_tool.d \
./lib/pin2.14/source/tools/Tests/rtnNumIns.d \
./lib/pin2.14/source/tools/Tests/rtn_create_at_dup.d \
./lib/pin2.14/source/tools/Tests/rtn_insert_call_probed.d \
./lib/pin2.14/source/tools/Tests/sec.d \
./lib/pin2.14/source/tools/Tests/segv.d \
./lib/pin2.14/source/tools/Tests/sequence.d \
./lib/pin2.14/source/tools/Tests/sequencecheck.d \
./lib/pin2.14/source/tools/Tests/set_df_flag_tool.d \
./lib/pin2.14/source/tools/Tests/set_status_flags_tool.d \
./lib/pin2.14/source/tools/Tests/smc_check.d \
./lib/pin2.14/source/tools/Tests/snprintf.d \
./lib/pin2.14/source/tools/Tests/sourceLocation_app.d \
./lib/pin2.14/source/tools/Tests/sourceLocation_img1.d \
./lib/pin2.14/source/tools/Tests/sourceLocation_img2.d \
./lib/pin2.14/source/tools/Tests/sourceLocation_tool.d \
./lib/pin2.14/source/tools/Tests/statdyn_app.d \
./lib/pin2.14/source/tools/Tests/statdyn_tool.d \
./lib/pin2.14/source/tools/Tests/swizzle1.d \
./lib/pin2.14/source/tools/Tests/symOutOfBound.d \
./lib/pin2.14/source/tools/Tests/syntax.d \
./lib/pin2.14/source/tools/Tests/syntax_tst.d \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_unix.d \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_win.d \
./lib/pin2.14/source/tools/Tests/test_ebx_in_exceptions_xed_interface.d \
./lib/pin2.14/source/tools/Tests/thread.d \
./lib/pin2.14/source/tools/Tests/threadApp.d \
./lib/pin2.14/source/tools/Tests/traceOriginal.d \
./lib/pin2.14/source/tools/Tests/tracecount.d \
./lib/pin2.14/source/tools/Tests/traceusage.d \
./lib/pin2.14/source/tools/Tests/util.d \
./lib/pin2.14/source/tools/Tests/verify.d \
./lib/pin2.14/source/tools/Tests/win_cvapp_test_tool.d \
./lib/pin2.14/source/tools/Tests/winapp_runs_pin.d \
./lib/pin2.14/source/tools/Tests/xedReg.d 

C_DEPS += \
./lib/pin2.14/source/tools/Tests/child_sig_while_execv_app.d \
./lib/pin2.14/source/tools/Tests/child_sig_while_execv_simple_app.d \
./lib/pin2.14/source/tools/Tests/exitProcessApp.d \
./lib/pin2.14/source/tools/Tests/foobar.d \
./lib/pin2.14/source/tools/Tests/illegalEnvp_app.d \
./lib/pin2.14/source/tools/Tests/int3test.d \
./lib/pin2.14/source/tools/Tests/memcpy_app.d \
./lib/pin2.14/source/tools/Tests/mysetenv.d \
./lib/pin2.14/source/tools/Tests/rep_ip_at_ipoint_after_app.d \
./lib/pin2.14/source/tools/Tests/smc_test_l.d \
./lib/pin2.14/source/tools/Tests/strcmp_app.d 


# Each subdirectory must supply rules for building sources it contributes
lib/pin2.14/source/tools/Tests/%.o: ../lib/pin2.14/source/tools/Tests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Tests/%.o: ../lib/pin2.14/source/tools/Tests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/pin2.14/source/tools/Tests/%.o: ../lib/pin2.14/source/tools/Tests/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


