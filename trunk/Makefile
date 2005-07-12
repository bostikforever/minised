# Makefile for minised

PREFIX=/usr

VERS=1.5

minised: sedcomp.o sedexec.o
	$(CC) $(LFLAGS) sedcomp.o sedexec.o -o minised

sedcomp.o: sedcomp.c sed.h
sedexec.o: sedexec.c sed.h

install:
	install minised $(PREFIX)/bin/

SOURCES = README BUGS Makefile sed.h sedcomp.c sedexec.c sed.1

clean:
	rm -f minised sedcomp.o sedexec.o

minised-$(VERS).tar.gz: $(SOURCES) minised.1
	@ls $(SOURCES) sed.1 | sed s:^:sed-$(VERS)/: >MANIFEST
	@(cd ..; ln -s sed sed-$(VERS))
	(cd ..; tar -czvf sed/sed-$(VERS).tar.gz `cat sed/MANIFEST`)
	@(cd ..; rm sed-$(VERS))

dist: minised-$(VERS).tar.gz

check: minised
	cd tests; ./run ../minised

