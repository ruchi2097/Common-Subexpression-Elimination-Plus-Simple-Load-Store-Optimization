# /* For copyright information, see olden_v1.01/COPYRIGHT */

include ../../Makefile.defs

SRC_DIR=/ece566/projects/p2/C++/../../../wolfbench/Benchmarks/dijkstra
INSTALL_DIR=/ece566/projects/p2/C++/install/bin

vpath %.c $(SRC_DIR)
vpath %.cpp $(SRC_DIR)

programs = dijkstra

.PHONY: all install

all: $(addsuffix $(EXTRA_SUFFIX),$(programs)) 

install: all 

DEFS    = 

SOURCES = dijkstra_large.c

# test information
INFILE  = /dev/null
OUTFILE = output_large$(EXTRA_SUFFIX).out
ARGS    = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/dijkstra/input.dat
COMPARE = /ece566/projects/p2/C++/../../../wolfbench/Benchmarks/dijkstra/output_large.txt $(OUTFILE)

include /ece566/projects/p2/C++/../../../wolfbench/Makefile.benchmark
include ../../Makefile.config
