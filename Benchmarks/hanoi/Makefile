# /* For copyright information, see olden_v1.01/COPYRIGHT */

include ../../Makefile.defs

SRC_DIR=/ece566/projects/p2/C++/../../../wolfbench/Benchmarks/hanoi
INSTALL_DIR=/ece566/projects/p2/C++/install/bin

vpath %.c $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

programs = hanoi

.PHONY: all install

all: $(addsuffix $(EXTRA_SUFFIX),$(programs)) 

install: all 

DEFS    = 

SOURCES = hanoi.c

# test information
INFILE  = /dev/null
OUTFILE = $(programs)$(EXTRA_SUFFIX).out
ARGS    = 2000 18
COMPARE = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/hanoi/output.hanoi $(OUTFILE)

include /ece566/projects/p2/C++/../../../wolfbench/Makefile.benchmark
include ../../Makefile.config
