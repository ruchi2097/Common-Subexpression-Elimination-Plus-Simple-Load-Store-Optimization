include ../Makefile.defs

SRC_DIR=/ece566/wolfbench/P2Tests
INSTALL_DIR=/ece566/projects/p2/C++/p2-test/install/bin

vpath %.c $(SRC_DIR)
vpath %.p2 $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

# Each entry specifies a test case:
#    test_00 :  test_00.c   is the test harness compiled with gcc
#               test_00.p2  is the minic code to be compiled using your p2 binary, into
#                           test_00-p2.bc
#               test_00 is the final binary created by linking test_00.bc and
#               test_00-p2.bc

# To create your own test case, make a file with these conventions:
#     <basename>.c <basename>.p2
#     ***Put them in either wolfbench/P2Tests or in your p2-tests/P2Tests directory
#     Add <basename> to the list tests in p2-tests/P2Tests/Makefile; or add them to 
#     wolfbench/P2Tests/Makefile.in and re-run the configure command in p2-tests

ece466 = \
	test_00 \
	test_01 \
	test_02 \
	test_03 \
	test_04 \
	test_05 \
	test_06 \
	test_07 \
	test_08 \
	test_09 # <basename>

ece566 = \
	test_10 \
	test_11 \
	test_12 \
	test_13 \
	test_14 # <basename>


programs = $(ece466) $(ece566)

.PHONY: all install

all: $(programs)

install: all $(addsuffix -install,$(programs))

test: all $(addsuffix -test,$(programs))
	@/ece566/wolfbench/summarize.py $(addsuffix -test,$(programs))

cleanall: clean

include /ece566/wolfbench/Makefile.P2
include ../Makefile.config

