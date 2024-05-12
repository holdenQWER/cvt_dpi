vcs: clean comp run

clean:
	-rm -rf csrc simv* comp.log sim.log ucli.key vc_hdrs.h verdi_config_file

comp: clean
	vcs -full64 \
	-kdb -lca \
	-debug_access+all \
	-sverilog \
	-timescale=1ns/1ns \
	./top.sv \
	./cvt12_dpi.c \
	-l comp.log 

run:
	./simv \
	-l sim.log 

CC=gcc
CFLAGS=-O2 -Wall
cvt12: cvt12.c
	$(CC) $(CFLAGS) cvt12.c -o cvt12 -lm
