prefix=/usr/local

install: md2rst
	install -m 0755 md2rst $(prefix)/bin

.PHONY: install
