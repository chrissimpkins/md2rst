#!/bin/sh

# TEST single Markdown file argument with .md file extension to default path RST write
cd testdir
md2rst TEST.md

FAILURES=0

if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst TEST.md' failed"
	FAILURES=1
fi

cd ..

# TEST single Markdown file argument without .md file extension succeeds if named README
cd testdir
md2rst README

if [[ -f README.rst ]]; then
	rm README.rst
else
	echo "'md2rst README' failed"
	FAILURES=1
fi

cd ..

# TEST succeeds when single Markdown argument used but the file name is not case-insensitive form of 'README'

cd testdir
md2rst TEST

if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst TEST' failed"
	FAILURES=1
fi

cd ..


# Report on whether all tests passed
if [[ $FAILURES -eq 0 ]]; then
	echo "ALL TESTS PASSED!"
	exit 0
else
	echo "THERE WERE TEST FAILURES"
	exit 1


