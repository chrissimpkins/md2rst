# md2rst

> Markdown to reStructuredText conversion script for Unix and Linux

### What is md2rst?

`md2rst` is a Python script that converts Markdown syntax files to reStructuredText syntax files with [Pandoc](http://pandoc.org).  Pandoc must be installed in order to use the script.

### Quickstart

- Confirm that Pandoc is installed on your system
- `$ git clone https://github.com/chrissimpkins/md2rst.git`
- `$ make install`
- `$ md2rst [Markdown file path]` (.rst file write defaults to same directory and original filename)
- `$ md2rst [Markdown file path] [rst file path]` (define .rst file path)

### Install

#### Install Pandoc

Install Pandoc using the [install instructions](http://pandoc.org/installing.html) provided on pandoc.org.

### Install `md2rst`

Obtain the repository files with git:

```
$ git clone https://github.com/chrissimpkins/md2rst.git
```

or [download the source repository](https://github.com/chrissimpkins/md2rst/archive/master.zip) and unpack it.

Navigate to the top level of the repository and install `md2rst` with the following command:

```
$ make install
```
