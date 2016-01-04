#!/bin/sh

FAILURES=0

# -----------------------
#
# Install test
#
# -----------------------


# [ TEST ]
#  confirms install success and installs the latest version for subsequent tests
#  NOTE: do not move this test below any of the following tests
cd ..
make install

if (( $? )); then
	echo "'make install' test failed"
	FAILURES=1
else
	echo "'make install' test passed"
fi

cd tests


# -----------------------
#
# Single argument tests
#
# -----------------------

# [ TEST ]
#  single Markdown file argument with .md file extension to default path RST write
cd testdir
md2rst TEST.md


if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst TEST.md' failed"
	FAILURES=1
fi

cd ..


# [ TEST ]
#  single Markdown file argument without .md file extension succeeds if named README
cd testdir
md2rst README

if [[ -f README.rst ]]; then
	rm README.rst
else
	echo "'md2rst README' failed"
	FAILURES=1
fi

cd ..


# [ TEST ]
#  succeeds when single Markdown argument used but the file name is not case-insensitive form of 'README'
cd testdir
md2rst TEST

if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst TEST' failed"
	FAILURES=1
fi

cd ..


# [ TEST ]
#  Single argument test from a different directory writes to the Markdown file containing directory
md2rst testdir/TEST.md

if [[ -f testdir/TEST.rst ]]; then
	rm testdir/TEST.rst
else
	echo "'md2rst testdir/TEST.md' failed"
	FAILURES=1
fi


# [ TEST ]
#  Single argument test from a different directory with a Markdown file that does not have a .md file extension
md2rst testdir/TEST

if [[ -f testdir/TEST.rst ]]; then
	rm testdir/TEST.rst
else
	echo "'md2rst testdir/TEST' failed"
	FAILURES=1
fi


# -----------------------
#
# Multi argument tests
#
# -----------------------


# [ TEST ]
#  Multi argument test with Markdown file that has .md extension + write to same directory
cd testdir
md2rst TEST.md TEST.rst

if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst TEST.md TEST.rst' failed"
	FAILURES=1
fi

cd ..


# [ TEST ]
#  Multi argument test with Markdown file that does not have .md extension but is named README + write to same directory
cd testdir
md2rst README TEST.rst

if [[ -f TEST.rst ]]; then
	rm TEST.rst
else
	echo "'md2rst README TEST.rst' failed"
	FAILURES=1
fi

cd ..


# [ TEST ]
#  Multi argument test for failure with Markdown file that does not have .md extension and is not named README
cd testdir
md2rst TEST TEST.rst 2>/dev/null

if (( $? )); then
	# if returns exit status code 1 (command failed), then test passed
	echo "md2rst TEST TEST.rst passed"
else
	if [[ -f TEST.rst ]]; then
		echo "'md2rst TEST TEST.rst' failed"
		FAILURES=1
	else
		echo "md2rst TEST TEST.rst passed"
	fi
fi

cd ..


# [ TEST ]
#  Multi argument test from different directory with Markdown file that has .md extension + write to same directory
md2rst testdir/TEST.md testdir/TEST.rst

if [[ -f testdir/TEST.rst ]]; then
	rm testdir/TEST.rst
else
	echo "'md2rst testdir/TEST.md testdir/TEST.rst' failed"
	FAILURES=1
fi


# [ TEST ]
#  Multi argument test from different directory with Markdown file that does not have .md extension but is named README + write to same directory
md2rst testdir/README testdir/TEST.rst

if [[ -f testdir/TEST.rst ]]; then
	rm testdir/TEST.rst
else
	echo "'md2rst testdir/README testdir/TEST.rst' failed"
	FAILURES=1
fi


# [ TEST ]
#  Multi argument test from different directory for failure with Markdown file that does not have .md extension and is not named README
md2rst testdir/TEST testdir/TEST.rst 2>/dev/null

if (( $? )); then
	# if returns exit status code 1 (command failed), then test passed
	echo "md2rst testdir/TEST testdir/TEST.rst passed"
else
	if [[ -f TEST.rst ]]; then
		echo "'md2rst testdir/TEST testdir/TEST.rst' failed"
		FAILURES=1
	else
		echo "md2rst testdir/TEST testdir/TEST.rst passed"
	fi
fi


# [ TEST ]
#   Test recursive directory path creation for requests that specify non-existent directory path
cd testdir
if [[ -d newdir ]]; then
	rm -rf newdir
fi

md2rst TEST.md newdir/TEST.rst

if [[ -f newdir/TEST.rst ]]; then
	rm -rf newdir
else
	echo "'md2rst TEST.md newdir/TEST.rst' failed"
	FAILURES=1
fi

cd ..


# Report on whether all tests passed
if [[ $FAILURES -eq 0 ]]; then
	echo "\nALL TESTS PASSED!"
	exit 0
else
	echo "\nTHERE WERE TEST FAILURES!"
	exit 1
fi


