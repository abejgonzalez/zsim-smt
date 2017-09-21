#configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j4

# testing
TESTDIR = ./tests/config
LOGDIR = ./log
TRACEDIR = ./tests/traces
TEST = $(TESTDIR)/smt.cfg
ZSIM = build/opt/zsim

# outputs
BUILDDIR = build/
LIBDIR = lib/
OUTPUT = heartbeat out.cfg *.out *.log* *.h5 .scons*

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	# ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

clean:
	$(RM) -rf  $(BUILDDIR)  $(OUTPUT) $(TRACEDIR) $(LOGDIR)


test: $(TEST) $(TRACEDIR) $(LOGDIR)
	$(ZSIM) $(TEST)	
	mv *.log* log

test-clean:
	$(RM) -rf  $(OUTPUT) $(TRACEDIR) $(LOGDIR)

$(TRACEDIR):
	mkdir -p $(TRACEDIR)

$(LOGDIR):
	mkdir -p $(LOGDIR)

############### unit tests ######################

CC = g++
CPPFLAGS = -Ibuild/opt -g -std=c++11

testArbitration: tests/testArbitration.cpp build/opt/arbitration.o
	$(CC) $(CPPFLAGS) -o $@ $?
