# Makefile for the MINIX sed utility

VERS=1.4

sed: sedcomp.o sedexec.o
	$(CC) $(LFLAGS) sedcomp.o sedexec.o -o sed

mnsed: mnsed.c
	$(CC) $(LFLAGS) mnsed.c -o mnsed

sedcomp.o: sedcomp.c sed.h
sedexec.o: sedexec.c sed.h

SOURCES = README BUGS Makefile sed.h sedcomp.c sedexec.c mnsed.c ctrans sedtest sed.1 sed.spec

clean:
	rm -f sed sedcomp.o sedexec.o mnsed

sed-$(VERS).tar.gz: $(SOURCES) sed.1
	@ls $(SOURCES) sed.1 | sed s:^:sed-$(VERS)/: >MANIFEST
	@(cd ..; ln -s sed sed-$(VERS))
	(cd ..; tar -czvf sed/sed-$(VERS).tar.gz `cat sed/MANIFEST`)
	@(cd ..; rm sed-$(VERS))

dist: sed-$(VERS).tar.gz

check: sed
	cd tests; ./run ../sed

