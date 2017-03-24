# configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j12

# outputs
BUILDDIR = build/
LIBDIR = lib/
OUTPUT = *.out *.log *.h5 .scons* 

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

clean:
	$(RM) -rf  $(BUILDDIR) $(LIBDIR) $(OUTPUT)

test-clean:
	$(RM) -rf  $(OUTPUT)
