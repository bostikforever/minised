# Makefile for minised

# If your compiler does not support this flags, just remove them.
# They only ensure that no new warning regressions make it into the source.

DESTDIR=
PREFIX=/usr
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1

c: alignment_c_d.d alignment_c.c
	dmd -betterC -preview=bitfields alignment_c_d.d -of=alignment_c

d: alignment.d
	dmd -betterC -preview=bitfields alignment.d -of=alignment

install:
	install -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)
	install -m 755 minised $(DESTDIR)$(BINDIR)
	install -m 644 minised.1 $(DESTDIR)$(MANDIR)

clean:
	rm -f alignment.*

.PHONY: install clean check
