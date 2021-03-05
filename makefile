.PHONY:com sim clean

OUTPUT = dcache
VCS_FLAG=-full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed

VCS = vcs $(VCS_FLAG) -sverilog +v2k -timescale=1ns/1ns                             \
	  -debug_all							\
	  -o ${OUTPUT}							\
	  -l compile.log						\

SIM = ./${OUTPUT} -l run.log


com:
	${VCS} -f sverilog.f

sim:
	${SIM}

clean:
	rm -rf ./csrc *.daidir *.log simv* *.key