# configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j12

# testing
TESTDIR = ./tests
TEST = $(TESTDIR)/oooe.cfg
ZSIM = zsim

# outputs
BUILDDIR = build/
LIBDIR = lib/
OUTPUT = *.out *.log *.log.3 *.h5 .scons* 

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

clean:
	$(RM) -rf  $(BUILDDIR) $(LIBDIR) $(OUTPUT)


test: $(TEST)
	$(ZSIM) $(TEST)	

test-clean:
	$(RM) -rf  $(OUTPUT)
