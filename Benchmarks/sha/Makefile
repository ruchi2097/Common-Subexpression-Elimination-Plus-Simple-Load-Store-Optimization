# /* For copyright information, see olden_v1.01/COPYRIGHT */

include ../../Makefile.defs

SRC_DIR=/ece566/projects/p2/C++/../../../wolfbench/Benchmarks/sha
INSTALL_DIR=/ece566/projects/p2/C++/install/bin

vpath %.c $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

programs = sha

.PHONY: all install

all: $(addsuffix $(EXTRA_SUFFIX),$(programs))

install: all 

DEFS    = -DLITTLE_ENDIAN

SOURCES = sha_driver.c sha.c

# test information
INFILE  = /dev/null
OUTFILE = $(programs)$(EXTRA_SUFFIX).out
ARGS    = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/sha/input_large.asc
COMPARE = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/sha/output.sha $(OUTFILE)

include /ece566/projects/p2/C++/../../../wolfbench/Makefile.benchmark
include ../../Makefile.config
