# Utility Scripts

## [`better-cd](/utils/better-cd)

Wrapper for `cd`, but it creates parent directories specified in the target.

### Usage

You can place it in `/usr/local/bin/bcd` (short for Better Change Directory) to run it as a command.

```bash
bcd this/path/doesnt/exist
```

> > Just like `cd`, but creates parents. May not have some `cd` features. Doesn't support flags.

Because `cd` doesn't work in scripts unless you use `source`, you need to add this to `~/.bashrc` (or equivalent):

```sh
alias bcd='source /usr/local/bin/bcd'
```

Then run:

```bash
source ~/.bashrc
```

> > To reload

## [`better-mv`](/utils/better-mv)

Wrapper for `mv`, but it creates parent directories specified in the target.

### Usage

You can place it in `/usr/local/bin/bmv` (short for Better MoVe) to run it as a command.

```bash
bmv /path/to/source /path/to/destination
```

> > Just like `mv`, but creates parents. May not have some `mv` features. Doesn't support flags.

## [`cat-dir`](/utils/cat-dir)

Runs `cat` on each file in the given directory. Best use-case is to read a bunch of small files quickly.

### Usage

```bash
./cat-dir <dir1> [dir2] [dir3]
```

Example:

```bash
./cat-dir ~/GitHub/ ~/GitHub/NikoboiNFTB/Shell-Scripts/
bash cat-dir ~/GitHub/ ~/GitHub/NikoboiNFTB/Shell-Scripts/
```

Or if placed in `/usr/local/bin/cat-dir` (recommended):

```bash
cat-dir ~/GitHub/ ~/GitHub/NikoboiNFTB/Shell-Scripts/
```

## [`find-file`](/utils/find-file)

Simple to use tool to find a file or folder anywhere in the current directory, while allowing you to ignore directories.

### Usage

Simply save the script in any folder and run:

```bash
bash find-file file1 file2 -i dir1 dir2
```

For example, if I want to find all `README*` files, except from my repositories:

```bash
bash find-file README* -i NikoboiNFTB
```

Much easier than running;

```bash
find . \( -name "README.md" -o -name "README.txt" -o -name "README" \) | grep -Ev "NikoboiNFTB"
```

## [`find-string`](/utils/find-string)

Similar to `find-file` but for file contents. Supports `-b | --begin` to find strings only at the beginning of lines.

## [`repeat`](/utils/repeat)

Repeat any command every given seconds. Optionally also clear the terminal between each command.

### Usage

```bash
bash repeat [--clear] <command_in_quotes> <interval_in_seconds>
```

> > Any order

Example:

```bash
repeat --clear "docker ps" 1
```

> > In this case the script has been placed in `/usr/local/bin/

Will run "ls -l" every five seconds, while clearing the terminal before each run.

This script is equivalent to running;

```bash
while true; do [clear &&] <command> && sleep <interval>; done
```

## [`sort`](/utils/sort)

Sort any file alphabetically.

### Usage

Save the script and run it anywhere:

```bash
bash sort <file>
```

> > This is a general use version of the sort file from [NikoboiNFTB/DeSlop/block/sort](https://github.com/NikoboiNFTB/DeSlop/blob/main/block/sort)
