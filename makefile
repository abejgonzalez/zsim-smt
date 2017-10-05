#configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j4 --d

# testing
TESTDIR = ./tests/config
LOGDIR = ./log
TRACEDIR = ./tests/traces
TEST = $(TESTDIR)/smt.cfg
ZSIM = $(BUILDDIR)/debug/zsim

# outputs
BUILDDIR = build
LIBDIR = lib/
OUTPUT = heartbeat out.cfg *.out *.log* *.h5 .scons*

# pin
PINBIN = lib/pin2.14/intel64/bin/pinbin
PIN = $(BUILDDIR)/debug/pin

build: src/ $(PIN)
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

$(PIN):
	cp $(PINBIN) $(PIN)

$(TRACEDIR):
	mkdir -p $(TRACEDIR)

$(LOGDIR):
	mkdir -p $(LOGDIR)

############### unit tests ######################

CC = g++
CPPFLAGS = -Ibuild/opt -g -std=c++11

testArbitration: tests/testArbitration.cpp build/opt/arbitration.o
	$(CC) $(CPPFLAGS) -o $@ $?
