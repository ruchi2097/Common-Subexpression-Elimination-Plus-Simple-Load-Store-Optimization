# /* For copyright information, see olden_v1.01/COPYRIGHT */

include ../../Makefile.defs

SRC_DIR=/ece566/wolfbench/Benchmarks/smatrix
INSTALL_DIR=/ece566/projects/p2/C++/p2-test/install/bin

vpath %.c $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

programs = smatrix

.PHONY: all install

all: $(addsuffix $(EXTRA_SUFFIX),$(programs))

install: all 

DEFS    = -D__GNUC__ -D_NO_LONGLONG -DPLAIN -DOLDEN

SOURCES = smatrix.c

# test information
INFILE  = /dev/null
OUTFILE = $(programs)$(EXTRA_SUFFIX).out
ARGS    = 1024
COMPARE = $(OUTFILE) /ece566/wolfbench/Benchmarks/smatrix/output.smatrix

# set longer timeout period for smatrix, default is 10s, raise to 20s
TIMEOUT = 20

include /ece566/wolfbench/Makefile.benchmark
include ../../Makefile.config
