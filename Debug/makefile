################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/virt/subdir.mk
-include src/g_heap/subdir.mk
-include src/subdir.mk
-include old/subdir.mk
-include misc/hooks/subdir.mk
-include lib/xed/examples/subdir.mk
-include lib/pin2.14/source/tools/Utils/subdir.mk
-include lib/pin2.14/source/tools/ToolUnitTests/subdir.mk
-include lib/pin2.14/source/tools/Tests/subdir.mk
-include lib/pin2.14/source/tools/SyscallsEmulation/subdir.mk
-include lib/pin2.14/source/tools/SyncTests/subdir.mk
-include lib/pin2.14/source/tools/SimpleExamples/subdir.mk
-include lib/pin2.14/source/tools/SignalTests/subdir.mk
-include lib/pin2.14/source/tools/SegmentsVirtualization/subdir.mk
-include lib/pin2.14/source/tools/SegTrace/subdir.mk
-include lib/pin2.14/source/tools/RtnTests/subdir.mk
-include lib/pin2.14/source/tools/Replay/subdir.mk
-include lib/pin2.14/source/tools/Regvalue/subdir.mk
-include lib/pin2.14/source/tools/Probes/subdir.mk
-include lib/pin2.14/source/tools/MyPinTool/subdir.mk
-include lib/pin2.14/source/tools/Mmx/subdir.mk
-include lib/pin2.14/source/tools/Mix/subdir.mk
-include lib/pin2.14/source/tools/Memory/subdir.mk
-include lib/pin2.14/source/tools/MemTranslate/subdir.mk
-include lib/pin2.14/source/tools/MemTrace/subdir.mk
-include lib/pin2.14/source/tools/MaskVector/subdir.mk
-include lib/pin2.14/source/tools/ManualExamples/subdir.mk
-include lib/pin2.14/source/tools/Maid/subdir.mk
-include lib/pin2.14/source/tools/MacTests/subdir.mk
-include lib/pin2.14/source/tools/JitProfilingApiTests/subdir.mk
-include lib/pin2.14/source/tools/InstrumentationOrderAndVersion/subdir.mk
-include lib/pin2.14/source/tools/InstructionTests/subdir.mk
-include lib/pin2.14/source/tools/InstLibExamples/subdir.mk
-include lib/pin2.14/source/tools/InstLib/subdir.mk
-include lib/pin2.14/source/tools/Insmix/subdir.mk
-include lib/pin2.14/source/tools/InlinedFuncsOpt/subdir.mk
-include lib/pin2.14/source/tools/ImageTests/subdir.mk
-include lib/pin2.14/source/tools/IArg/subdir.mk
-include lib/pin2.14/source/tools/I18N/subdir.mk
-include lib/pin2.14/source/tools/GracefulExit/subdir.mk
-include lib/pin2.14/source/tools/Debugger/subdir.mk
-include lib/pin2.14/source/tools/DebugTrace/subdir.mk
-include lib/pin2.14/source/tools/DebugInfo/subdir.mk
-include lib/pin2.14/source/tools/CrossIa32Intel64/subdir.mk
-include lib/pin2.14/source/tools/Cpp11Tests/subdir.mk
-include lib/pin2.14/source/tools/ChildProcess/subdir.mk
-include lib/pin2.14/source/tools/CacheClient/subdir.mk
-include lib/pin2.14/source/tools/Buffer/subdir.mk
-include lib/pin2.14/source/tools/AttachDetach/subdir.mk
-include lib/pin2.14/source/tools/AlignChk/subdir.mk
-include lib/pin2.14/source/launcher/subdir.mk
-include lib/pin2.14/extras/xed-intel64/examples/subdir.mk
-include lib/pin2.14/extras/xed-ia32/examples/subdir.mk
-include lib/libelf0.8.13/po/subdir.mk
-include lib/libelf0.8.13/lib/subdir.mk
-include lib/libconfig1.5/tinytest/subdir.mk
-include lib/libconfig1.5/tests/subdir.mk
-include lib/libconfig1.5/lib/.libs/subdir.mk
-include lib/libconfig1.5/lib/subdir.mk
-include lib/libconfig1.5/examples/c++/subdir.mk
-include lib/libconfig1.5/examples/c/subdir.mk
-include lib/libconfig1.5/contrib/libconfig-ruby/ext/subdir.mk
-include lib/libconfig1.5/contrib/cmake/src/subdir.mk
-include lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdCXX/subdir.mk
-include lib/libconfig1.5/contrib/cmake/CMakeFiles/CompilerIdC/subdir.mk
-include lib/libconfig1.5/contrib/subdir.mk
-include lib/hdf5/share/hdf5_examples/hl/c++/subdir.mk
-include lib/hdf5/share/hdf5_examples/hl/c/subdir.mk
-include lib/hdf5/share/hdf5_examples/c++/subdir.mk
-include lib/hdf5/share/hdf5_examples/c/subdir.mk
-include build/opt/virt/subdir.mk
-include build/opt/g_heap/subdir.mk
-include build/opt/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: oooe

# Tool invocations
oooe: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	g++  -o "oooe" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(CC_DEPS)$(C++_DEPS)$(EXECUTABLES)$(C_UPPER_DEPS)$(CXX_DEPS)$(OBJS)$(CPP_DEPS)$(C_DEPS) oooe
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
