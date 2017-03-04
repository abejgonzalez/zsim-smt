# configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j16

# outputs
BUILDDIR = build/
LIBDIR = lib/
OUTPUT = *.h5 .scons*

build: 
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)

clean:
	$(RM) -rf  $(BUILDDIR) $(LIBDIR) $(OUTPUT)
