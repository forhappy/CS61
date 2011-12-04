TARGETS=futex.2 futex.4 futex2.html futex4.html
SOURCES=futex2.sgml futex4.sgml Makefile

all: $(TARGETS) futex-manpages.tar.gz

futex-manpages.tar.gz: $(TARGETS)
	rm -rf futex-manpages
	mkdir futex-manpages
	cp $(TARGETS) $(SOURCES) futex-manpages
	tar cvzf futex-manpages.tar.gz futex-manpages

clean:
	rm -f *.2 *.4 futex[24].html *~

futex.2: futex2.sgml
	docbook2man futex2.sgml

futex.4: futex4.sgml
	docbook2man futex4.sgml

futex2.html: futex2.sgml
	docbook2html $<
	mv index.html $@

futex4.html: futex4.sgml
	docbook2html $<
	mv index.html $@

publish:
	scp $(TARGETS) $(SOURCES) index.html futex-manpages.tar.gz ds9a.nl:/var/www/ds9a.nl/futex-manpages/