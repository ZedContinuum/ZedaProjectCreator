# Makefile

Name    = $(shell basename $(CURDIR))
Version = 0.0.0-alpha

CC      = gcc
BFlags  = -std=c11 -march=native
CFlags  = $(BFlags) -w -O3 `pkg-config --cflags gtk+-3.0`
DFlags  = $(BFlags) -Wall -g -O2
LFlags  = `pkg-config --libs gtk+-3.0`

Sources = $(shell find . -name "*.c" -printf '%P\n')
Manuals = $(CURDIR)/man
Scripts = $(CURDIR)/scripts
Tests   = $(CURDIR)/tests
Install = /usr/local

Build   = $(CURDIR)/build
Bin     = $(Build)/bin
Lib     = $(Build)/lib
Man     = $(Build)/man
Share   = $(Build)/share

export Name Version
export CC BFlags CFlags DFlags LFlags
export Sources Manuals Scripts Tests Install
export Build Bin Lib Man Share

all: $(Sources)
	test -d $(Bin) || mkdir -p $(Bin); \
	$(CC) $(CFlags) $(Sources) $(LFlags) -o $(Bin)/$(Name)

debug: $(Sources)
	test -d $(Bin) || mkdir -p $(Bin); \
	$(CC) $(DFlags) $(Sources) $(LFlags) -o $(Bin)/$(Name)

#test:

install:
	test -d $(Bin)   && cp -r $(Bin)/*   $(Install)/bin/; \
	test -d $(Lib)   && cp -r $(Lib)/*   $(Install)/lib/; \
	test -d $(Man)   && cp -r $(Man)/*   $(Install)/man/; \
	test -d $(Share) && cp -r $(Share)/* $(Install)/share/

#uninstall:

clean:
	@rm -rf $(Build)
	@rm -rf resources.c

resources:
	@glib-compile-resources --target=resources.c --generate-source --sourcedir=./ui ui/Resources.xml

#distclean:

help:
	@echo "make: $(Name): Available options:"
	@echo "  (default)    Build '$(Name)' with '$(CFlags)'"
	@echo "  resources	Build the Resouces, this must be done first"
	@echo "	 debug	      Build '$(Name)' with '$(DFlags)'"
#	@echo "	 test	      Run all tests in testing suite"
	@echo "	 install      Install '$(Name)' to '$(Install)'"
#	@echo "	 uninstall    Remove '$(Name)' from '$(Install)'"
	@echo "	 clean	      Delete temporary files"
#	@echo "	 distclean    Delete all unshipped files"
