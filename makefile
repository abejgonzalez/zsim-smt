#configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j4 --d

# testing
TESTDIR = ./tests/config
LOGDIR = ./log
TRACEDIR = ./tests/traces
PLOTDIR = ./tests/plots
PLOTSCRIPT = visual.py
TEST = $(TESTDIR)/smt.cfg
ZSIM = $(BUILDDIR)/debug/zsim

# outputs
BUILDDIR = build
LIBDIR = lib/
OUTPUT = heartbeat out.cfg *.out *.log* *.h5 .scons*

# pin
PINBIN = lib/pin2.14/intel64/bin/pinbin
PIN = $(BUILDDIR)/debug/pin

# sampling
UPLOAD = ./upload.sh
SAMPLE = ./sample.sh
SMT_TEMPLATE = tests/config/smt_template.cfg

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	# ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

clean:
	$(RM) -rf  $(BUILDDIR)  $(OUTPUT) $(TRACEDIR) $(LOGDIR)

test: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST)	
	mv *.log* log

sample: $(SAMPLE) $(SMT_TEMPLATE)
	$(SAMPLE) $(SMT_TEMPLATE)

upload: $(UPLOAD)
	$(UPLOAD)

test-clean:
	$(RM) -rf  $(OUTPUT) $(TRACEDIR) $(LOGDIR)

log-clean:
	$(RM) $(LOGDIR)/*

trace-clean:
	$(RM) -rf $(TRACEDIR)

plot: $(PLOTDIR) $(TRACEDIR)
	bash -c "cd tests && python $(PLOTSCRIPT)"

$(PIN):
	cp $(PINBIN) $(PIN)

$(TRACEDIR):
	mkdir -p $(TRACEDIR)

$(PLOTDIR):
	mkdir -p $(PLOTDIR)

$(LOGDIR):
	mkdir -p $(LOGDIR)

############### unit tests ######################

CC = g++
CPPFLAGS = -Ibuild/opt -g -std=c++11

testArbitration: tests/testArbitration.cpp build/opt/arbitration.o
	$(CC) $(CPPFLAGS) -o $@ $?
