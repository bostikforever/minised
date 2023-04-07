# Makefile for minised

# If your compiler does not support this flags, just remove them.
# They only ensure that no new warning regressions make it into the source.
CFLAGS += -O1 -Wall -Wwrite-strings

DESTDIR=
PREFIX=/usr
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1

minised: sedcomp.c sedexec.c sed.h
	dmd -betterC sedcomp.c sedexec.c -of=minised

install:
	install -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)
	install -m 755 minised $(DESTDIR)$(BINDIR)
	install -m 644 minised.1 $(DESTDIR)$(MANDIR)

clean:
	rm -f minised sedcomp.o sedexec.o

check: minised
	cd tests; ./run ../minised

.PHONY: install clean check
