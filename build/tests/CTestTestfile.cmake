# CMake generated Testfile for 
# Source directory: /ece566/projects/p2/C++/tests
# Build directory: /ece566/projects/p2/C++/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(CSEDead-cse0 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse0-out.ll" "/ece566/projects/p2/C++/tests/cse0.ll")
set_tests_properties(CSEDead-cse0 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;46;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(CSEElim-cse1 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse1-out.ll" "/ece566/projects/p2/C++/tests/cse1.ll")
set_tests_properties(CSEElim-cse1 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;47;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(CSESimplify-cse2 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse2-out.ll" "/ece566/projects/p2/C++/tests/cse2.ll")
set_tests_properties(CSESimplify-cse2 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;48;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(CSELdElim-cse3 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse3-out.ll" "/ece566/projects/p2/C++/tests/cse3.ll")
set_tests_properties(CSELdElim-cse3 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;49;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(CSEStore2Load-cse4 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse4-out.ll" "/ece566/projects/p2/C++/tests/cse4.ll")
set_tests_properties(CSEStore2Load-cse4 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;50;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(CSEStElim-cse5 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse5-out.ll" "/ece566/projects/p2/C++/tests/cse5.ll")
set_tests_properties(CSEStElim-cse5 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;51;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Other-cse6 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse6-out.ll" "/ece566/projects/p2/C++/tests/cse6.ll")
set_tests_properties(Other-cse6 PROPERTIES  _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;30;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;52;p2_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-CSEDead-cse0 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse0-nocse.ll" "/ece566/projects/p2/C++/tests/cse0.ll")
set_tests_properties(Fail-CSEDead-cse0 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;54;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-CSEElim-cse1 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse1-nocse.ll" "/ece566/projects/p2/C++/tests/cse1.ll")
set_tests_properties(Fail-CSEElim-cse1 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;55;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-CSESimplify-cse2 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse2-nocse.ll" "/ece566/projects/p2/C++/tests/cse2.ll")
set_tests_properties(Fail-CSESimplify-cse2 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;56;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-CSELdElim-cse3 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse3-nocse.ll" "/ece566/projects/p2/C++/tests/cse3.ll")
set_tests_properties(Fail-CSELdElim-cse3 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;57;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-CSEStore2Load-cse4 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse4-nocse.ll" "/ece566/projects/p2/C++/tests/cse4.ll")
set_tests_properties(Fail-CSEStore2Load-cse4 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;58;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-CSEStElim-cse5 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse5-nocse.ll" "/ece566/projects/p2/C++/tests/cse5.ll")
set_tests_properties(Fail-CSEStElim-cse5 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;59;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
add_test(Fail-Other-cse6 "/usr/bin/FileCheck-17" "--input-file=/ece566/projects/p2/C++/build/tests/cse6-nocse.ll" "/ece566/projects/p2/C++/tests/cse6.ll")
set_tests_properties(Fail-Other-cse6 PROPERTIES  WILL_FAIL "TRUE" _BACKTRACE_TRIPLES "/ece566/projects/p2/C++/tests/CMakeLists.txt;15;add_test;/ece566/projects/p2/C++/tests/CMakeLists.txt;60;p2_test_nocse;/ece566/projects/p2/C++/tests/CMakeLists.txt;0;")
