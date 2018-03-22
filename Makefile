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
TEST = $(TESTDIR)/simple.cfg
ZSIM = $(BUILDDIR)/debug/zsim

# outputs
BUILDDIR = build
LIBDIR = lib/
OUTPUT = heartbeat out.cfg *.out *.log* *.h5 .scons*

# pin
PINBIN = lib/pin2.14/intel64/bin/pinbin
PIN = $(BUILDDIR)/debug/pin

# sampling
UPLOAD = ./benchmark/upload.sh
SAMPLE = ./benchmark/sample.sh
TEMPLATE_SMT = tests/config/smt_template.cfg
TEMPLATE_OOO = tests/config/ooo_template.cfg

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	# ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

test: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST)	
	mv *.log* log


# sampling and uploading

BENCH_DIR = benchmark
SIM_DIR = $(BENCH_DIR)/zsim
BENCH = \
	$(SIM_DIR)/branch_good \
	$(SIM_DIR)/branch_miss \
	$(SIM_DIR)/dcache_good \
	$(SIM_DIR)/dcache_miss \
	$(SIM_DIR)/icache_good \
	$(SIM_DIR)/icache_miss 

$(BENCH):
	make -C $(BENCH_DIR) zsim

upload: $(UPLOAD)
	$(UPLOAD)

sample: sample-smt sample-ooo

sample-smt: build $(BENCH) $(SAMPLE) $(TEMPLATE_SMT)
	$(SAMPLE) $(TEMPLATE_SMT) smt

sample-ooo: build $(BENCH) $(SAMPLE) $(TEMPLATE_OOO)
	$(SAMPLE) $(TEMPLATE_OOO) ooo

# cleaning

clean:
	$(RM) -rf  $(BUILDDIR)  $(OUTPUT) $(TRACEDIR) $(LOGDIR)

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
