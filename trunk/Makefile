# Makefile for minised

PREFIX=/usr

minised: sedcomp.o sedexec.o
	$(CC) $(LFLAGS) sedcomp.o sedexec.o -o minised

sedcomp.o: sedcomp.c sed.h
sedexec.o: sedexec.c sed.h

install:
	install minised $(PREFIX)/bin/
	install minised.1 $(PREFIX)/man/man1/

clean:
	rm -f minised sedcomp.o sedexec.o

check: minised
	cd tests; ./run ../minised

