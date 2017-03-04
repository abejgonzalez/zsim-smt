# configure and build
CONFIGURE = ./configure.sh
MAKE = ${SCONSPATH}/bin/scons
MAKEFLAGS = -j16

# outputs
BUILDDIR = build/
LIBDIR = lib/
OUTPUT = *.h5 .scons*

build: 
	$(CONFIGURE)
	$(MAKE) $(MAKEFLAGS)

clean:
	$(RM) $(BUILDDIR) $(LIBDIR) $(OUTPUT)
