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

# Utility rule file for basicmath-out.bc.

# Include any custom commands dependencies for this target.
include tests/CMakeFiles/basicmath-out.bc.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/basicmath-out.bc.dir/progress.make

tests/CMakeFiles/basicmath-out.bc: p2
tests/CMakeFiles/basicmath-out.bc: /ece566/projects/p2/C++/tests/basicmath.ll
	cd /ece566/projects/p2/C++/build/tests && /ece566/projects/p2/C++/build/p2 -verbose /ece566/projects/p2/C++/tests/basicmath.ll basicmath-out.bc

basicmath-out.bc: tests/CMakeFiles/basicmath-out.bc
basicmath-out.bc: tests/CMakeFiles/basicmath-out.bc.dir/build.make
.PHONY : basicmath-out.bc

# Rule to build all files generated by this target.
tests/CMakeFiles/basicmath-out.bc.dir/build: basicmath-out.bc
.PHONY : tests/CMakeFiles/basicmath-out.bc.dir/build

tests/CMakeFiles/basicmath-out.bc.dir/clean:
	cd /ece566/projects/p2/C++/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/basicmath-out.bc.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/basicmath-out.bc.dir/clean

tests/CMakeFiles/basicmath-out.bc.dir/depend:
	cd /ece566/projects/p2/C++/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /ece566/projects/p2/C++ /ece566/projects/p2/C++/tests /ece566/projects/p2/C++/build /ece566/projects/p2/C++/build/tests /ece566/projects/p2/C++/build/tests/CMakeFiles/basicmath-out.bc.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/basicmath-out.bc.dir/depend
