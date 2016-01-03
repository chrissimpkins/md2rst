prefix=/usr/local

install: md2rst
	install -m 0755 md2rst $(prefix)/bin

clean: md2rst
	rm $(prefix)/bin/md2rst

.PHONY: install clean
