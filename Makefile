prefix=/usr/local

install: src/md2rst
	install -m 0755 src/md2rst $(prefix)/bin

clean: src/md2rst
	rm $(prefix)/bin/md2rst

.PHONY: install clean
