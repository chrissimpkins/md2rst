# md2rst

> A Python Markdown to reStructuredText conversion script for Unix and Linux

### What is md2rst?

`md2rst` is a Python script that converts Markdown syntax files to reStructuredText syntax files with [Pandoc](http://pandoc.org).  Pandoc does all of the heavy lifting and must be installed in order to use the script.

## Quickstart

- Confirm that Pandoc is installed on your system
- `$ git clone https://github.com/chrissimpkins/md2rst.git`
- `$ make install`
- `$ md2rst [Markdown file path]` (.rst file write defaults to same directory and original filename)
- `$ md2rst [Markdown file path] [rst file path]` (define .rst file path)

## Install

### Install Pandoc

Install Pandoc using the [install instructions](http://pandoc.org/installing.html) provided on pandoc.org.

Confirm your Pandoc install with:

```
$ which pandoc
```

If the above command reports a path to your `pandoc` executable, you're good to go.

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

`md2rst` is installed on the path `/usr/local/bin/md2rst` by default.  You can modify the [prefix variable in the Makefile](https://github.com/chrissimpkins/md2rst/blob/master/Makefile#L1) to change the install path.

## Usage

### Default

```
$ md2rst [Markdown file path]
```

By default, `md2rst` writes the reStructuredText file in the directory that contains the Markdown file and uses the same base file name as the Markdown file.

### Define reStructuredText file path

```
$ md2rst [Markdown file path] [rst file path]
```

Add a second argument to define the reStructuredText file path.  The order of the file paths in the command is not relevant if you either:

- include a Markdown file that has a .md file extension
- include a Markdown file named README (case-insensitive)

## Uninstall `md2rst`

If you installed the executable on the default path (or modified the prefix variable and maintained the original Makefile), you can uninstall `md2rst` with the command:

```
$ make uninstall
```

If you don't have the original Makefile, you can uninstall the executable with the following command:

```
$ rm $(which md2rst)
```

## Issues

If you have any problems with the script, please [file a new issue report](https://github.com/chrissimpkins/md2rst/issues/new) on the Github repository.

## License
`md2rst` is licensed under the MIT license.  The full text of the license is available [here](https://github.com/chrissimpkins/md2rst/blob/master/LICENSE).
