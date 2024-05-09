# CMake generated Testfile for 
# Source directory: /ece566/projects/p2/C++
# Build directory: /ece566/projects/p2/C++/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Usage "/ece566/projects/p2/C++/build/p2" "-h")
set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "USAGE:" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/CMakeLists.txt;25;add_test;/ece566/projects/p2/C++/CMakeLists.txt;0;")
subdirs("tests")
