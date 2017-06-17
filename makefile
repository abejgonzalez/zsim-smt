#configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j12

# testing
TESTDIR = ./tests
TEST = $(TESTDIR)/copy.cfg
ZSIM = build/opt/zsim

# outputs
BUILDDIR = build/
LIBDIR = lib/
OUTPUT = *.out *.log.*  *.h5 .scons* traces/* 

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	# ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

clean:
	$(RM) -rf  $(BUILDDIR) $(LIBDIR) $(OUTPUT)


test: $(TEST)
	$(ZSIM) $(TEST)	

test-clean:
	$(RM) -rf  $(OUTPUT)
