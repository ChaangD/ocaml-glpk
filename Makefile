PROGNAME = ocaml-glpk
DISTFILES = CHANGES COPYING Makefile README VERSION \
            src/Makefile src/OCamlMakefile src/META src/*.ml src/*.mli src/*.c \
            src/oldapi/* \
            examples/Makefile examples/OCamlMakefile examples/*.ml \
            doc/html
VERSION := $(shell cat VERSION)

all: byte

byte opt clean install uninstall:
	make -C src $@

distclean: clean
	rm -rf doc

doc: byte
	mkdir -p doc/html
	ocamldoc -html -m A -stars -I src -d doc/html src/glpk.mli src/glpk.ml

dist: doc
	mkdir $(PROGNAME)-$(VERSION)
	cp -r --parents $(DISTFILES) $(PROGNAME)-$(VERSION)
	tar zcvf ../$(PROGNAME)-$(VERSION).tar.gz $(PROGNAME)-$(VERSION)
	rm -rf $(PROGNAME)-$(VERSION)

.PHONY: doc
