# Makefile for the MINIX sed utility

VERSION=1.3

CFLAGS=-g
LFLAGS=-lg

sed: sedcomp.o sedexec.o
	cc $(LFLAGS) sedcomp.o sedexec.o -o sed

mnsed: mnsed.c
	cc $(LFLAGS) mnsed.c -o mnsed

sedcomp.o: sedcomp.c sed.h
sedexec.o: sedexec.c sed.h

FILES = READ.ME BUGS Makefile sed.h sedcomp.c sedexec.c mnsed.c ctrans sedtest sed.1 sed.lsm

sed-$(VERSION).tar: $(FILES)
	tar -cvf sed-$(VERSION).tar $(FILES)

sed-$(VERSION).tar.gz: sed-$(VERSION).tar
	gzip sed-$(VERSION).tar

clean:
	rm -f sed sedcomp.o sedexec.o mnsed

