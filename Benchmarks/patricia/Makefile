# /* For copyright information, see olden_v1.01/COPYRIGHT */

include ../../Makefile.defs

SRC_DIR=/ece566/projects/p2/C++/../../../wolfbench/Benchmarks/patricia
INSTALL_DIR=/ece566/projects/p2/C++/install/bin

vpath %.c $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

programs = patricia

.PHONY: all install

all: $(addsuffix $(EXTRA_SUFFIX),$(programs))

install: all 

DEFS    = 

SOURCES = patricia.c patricia_test.c

# test information
INFILE  = /dev/null
OUTFILE = $(programs)$(EXTRA_SUFFIX).out
ARGS    = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/patricia/large.udp
COMPARE = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/patricia/output.patricia $(OUTFILE)

include /ece566/projects/p2/C++/../../../wolfbench/Makefile.benchmark
include ../../Makefile.config
