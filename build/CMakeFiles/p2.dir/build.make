# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /ece566/projects/p2/C++

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /ece566/projects/p2/C++/build

# Include any dependencies generated for this target.
include CMakeFiles/p2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/p2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/p2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/p2.dir/flags.make

CMakeFiles/p2.dir/p2.cpp.o: CMakeFiles/p2.dir/flags.make
CMakeFiles/p2.dir/p2.cpp.o: /ece566/projects/p2/C++/p2.cpp
CMakeFiles/p2.dir/p2.cpp.o: CMakeFiles/p2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/ece566/projects/p2/C++/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/p2.dir/p2.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/p2.dir/p2.cpp.o -MF CMakeFiles/p2.dir/p2.cpp.o.d -o CMakeFiles/p2.dir/p2.cpp.o -c /ece566/projects/p2/C++/p2.cpp

CMakeFiles/p2.dir/p2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/p2.dir/p2.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /ece566/projects/p2/C++/p2.cpp > CMakeFiles/p2.dir/p2.cpp.i

CMakeFiles/p2.dir/p2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/p2.dir/p2.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /ece566/projects/p2/C++/p2.cpp -o CMakeFiles/p2.dir/p2.cpp.s

# Object files for target p2
p2_OBJECTS = \
"CMakeFiles/p2.dir/p2.cpp.o"

# External object files for target p2
p2_EXTERNAL_OBJECTS =

p2: CMakeFiles/p2.dir/p2.cpp.o
p2: CMakeFiles/p2.dir/build.make
p2: /usr/lib/llvm-17/lib/libLLVMAnalysis.a
p2: /usr/lib/llvm-17/lib/libLLVMBitReader.a
p2: /usr/lib/llvm-17/lib/libLLVMBitWriter.a
p2: /usr/lib/llvm-17/lib/libLLVMCodeGen.a
p2: /usr/lib/llvm-17/lib/libLLVMCore.a
p2: /usr/lib/llvm-17/lib/libLLVMAsmParser.a
p2: /usr/lib/llvm-17/lib/libLLVMIRReader.a
p2: /usr/lib/llvm-17/lib/libLLVMInstCombine.a
p2: /usr/lib/llvm-17/lib/libLLVMInstrumentation.a
p2: /usr/lib/llvm-17/lib/libLLVMMC.a
p2: /usr/lib/llvm-17/lib/libLLVMObjCARCOpts.a
p2: /usr/lib/llvm-17/lib/libLLVMScalarOpts.a
p2: /usr/lib/llvm-17/lib/libLLVMSupport.a
p2: /usr/lib/llvm-17/lib/libLLVMipo.a
p2: /usr/lib/llvm-17/lib/libLLVMTarget.a
p2: /usr/lib/llvm-17/lib/libLLVMTransformUtils.a
p2: /usr/lib/llvm-17/lib/libLLVMVectorize.a
p2: /usr/lib/llvm-17/lib/libLLVMCodeGenTypes.a
p2: /usr/lib/llvm-17/lib/libLLVMBitWriter.a
p2: /usr/lib/llvm-17/lib/libLLVMInstrumentation.a
p2: /usr/lib/llvm-17/lib/libLLVMFrontendOpenMP.a
p2: /usr/lib/llvm-17/lib/libLLVMScalarOpts.a
p2: /usr/lib/llvm-17/lib/libLLVMInstCombine.a
p2: /usr/lib/llvm-17/lib/libLLVMAggressiveInstCombine.a
p2: /usr/lib/llvm-17/lib/libLLVMLinker.a
p2: /usr/lib/llvm-17/lib/libLLVMTransformUtils.a
p2: /usr/lib/llvm-17/lib/libLLVMAnalysis.a
p2: /usr/lib/llvm-17/lib/libLLVMProfileData.a
p2: /usr/lib/llvm-17/lib/libLLVMSymbolize.a
p2: /usr/lib/llvm-17/lib/libLLVMDebugInfoPDB.a
p2: /usr/lib/llvm-17/lib/libLLVMDebugInfoMSF.a
p2: /usr/lib/llvm-17/lib/libLLVMDebugInfoBTF.a
p2: /usr/lib/llvm-17/lib/libLLVMDebugInfoDWARF.a
p2: /usr/lib/llvm-17/lib/libLLVMObject.a
p2: /usr/lib/llvm-17/lib/libLLVMIRReader.a
p2: /usr/lib/llvm-17/lib/libLLVMBitReader.a
p2: /usr/lib/llvm-17/lib/libLLVMAsmParser.a
p2: /usr/lib/llvm-17/lib/libLLVMCore.a
p2: /usr/lib/llvm-17/lib/libLLVMRemarks.a
p2: /usr/lib/llvm-17/lib/libLLVMBitstreamReader.a
p2: /usr/lib/llvm-17/lib/libLLVMMCParser.a
p2: /usr/lib/llvm-17/lib/libLLVMMC.a
p2: /usr/lib/llvm-17/lib/libLLVMDebugInfoCodeView.a
p2: /usr/lib/llvm-17/lib/libLLVMTextAPI.a
p2: /usr/lib/llvm-17/lib/libLLVMBinaryFormat.a
p2: /usr/lib/llvm-17/lib/libLLVMTargetParser.a
p2: /usr/lib/llvm-17/lib/libLLVMSupport.a
p2: /usr/lib/llvm-17/lib/libLLVMDemangle.a
p2: /usr/lib/aarch64-linux-gnu/libz.so
p2: /usr/lib/aarch64-linux-gnu/libzstd.so
p2: /usr/lib/aarch64-linux-gnu/libtinfo.so
p2: CMakeFiles/p2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/ece566/projects/p2/C++/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable p2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/p2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/p2.dir/build: p2
.PHONY : CMakeFiles/p2.dir/build

CMakeFiles/p2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/p2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/p2.dir/clean

CMakeFiles/p2.dir/depend:
	cd /ece566/projects/p2/C++/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /ece566/projects/p2/C++ /ece566/projects/p2/C++ /ece566/projects/p2/C++/build /ece566/projects/p2/C++/build /ece566/projects/p2/C++/build/CMakeFiles/p2.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/p2.dir/depend

