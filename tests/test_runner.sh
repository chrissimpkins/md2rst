#!/bin/sh

# -----------------------
#
# Single argument tests
#
# -----------------------

# [ TEST ] single Markdown file argument with .md file extension to default path RST write
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

# [ TEST ] single Markdown file argument without .md file extension succeeds if named README
cd testdir
md2rst README

if [[ -f README.rst ]]; then
	rm README.rst
else
	echo "'md2rst README' failed"
	FAILURES=1
fi

cd ..

# [ TEST ] succeeds when single Markdown argument used but the file name is not case-insensitive form of 'README'

cd testdir
md2rst TEST

if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst TEST' failed"
	FAILURES=1
fi

cd ..


# [ TEST ] Single argument test from a different directory writes to the Markdown file containing directory

md2rst testdir/TEST.md

if [[ -f testdir/TEST.rst ]]; then
	rm testdir/TEST.rst
else
	echo "'md2rst testdir/TEST.md' failed"
	FAILURES=1
fi


# [ TEST ] Single argument test from a different directory with a Markdown file that does not have a .md file extension

md2rst testdir/TEST

if [[ -f testdir/TEST.rst ]]; then
	rm testdir/TEST.rst
else
	echo "'md2rst testdir/TEST' failed"
	FAILURES=1
fi


# Report on whether all tests passed
if [[ $FAILURES -eq 0 ]]; then
	echo "\nALL TESTS PASSED!"
	exit 0
else
	echo "\nTHERE WERE TEST FAILURES!"
	exit 1
fi


