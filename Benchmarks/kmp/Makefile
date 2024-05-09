# /* For copyright information, see olden_v1.01/COPYRIGHT */

include ../../Makefile.defs

SRC_DIR=/ece566/projects/p2/C++/../../../wolfbench/Benchmarks/kmp
INSTALL_DIR=/ece566/projects/p2/C++/install/bin

vpath %.c $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

programs = kmp

.PHONY: all install

all: $(addsuffix $(EXTRA_SUFFIX),$(programs))

install: all

DEFS    = 

SOURCES = kmp.c rndnums.c

# test information
INFILE  = /dev/null
OUTFILE = $(addsuffix $(EXTRA_SUFFIX).out,$(programs))
ARGS    = ref
COMPARE = $(OUTFILE) /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/kmp/output.kmp

include /ece566/projects/p2/C++/../../../wolfbench/Makefile.benchmark
include ../../Makefile.config
