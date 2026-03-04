# Shell Scripts

Miscellanious utility scripts.

## Scripts

### [`find-file`](/utils/find-file)

Simple to use tool to find a file or folder anywhere in the current directory, while allowing you to ignore directories.

#### Usage

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

### [`find-string`](/utils/find-string)

Similar to `find-file` but for file contents.

### [`repeat`](/utils/repeat)

Repeat any command every given seconds. Optionally also clear the terminal between each command.

#### Usage

```bash
bash repeat [--clear] <command_in_quotes> <interval_in_seconds>
```

>Any order

Example:

```bash
repeat --clear "ls -l" 5
```

>In this case the script has been places in `/usr/local/bin/

Will run "ls -l" every five seconds, while clearing the terminal before each run.

This script is equivalent to running;

```bash
while true; do clear && <command> && sleep <interval>; done
```

### [`sort`](/utils/sort)

Sort any file alphabetically.

#### Usage

Save the script and run it anywhere:

```bash
bash sort <file>
```

>> This is a general use version of the sort file from [NikoboiNFTB/DeSlop/block/sort](https://github.com/NikoboiNFTB/DeSlop/blob/main/block/sort)

### [`cont`](/continue/cont)

Wrapper for the `cn` command with your custom config. 

#### Usage

```bash
cont "Some prompt text"
```

This will execute:

```
cn --config ~/.continue/config.yaml -p "<prompt>"
```

All arguments are passed as a single string to the `-p` flag.

This is meant to bypass the stupid cloud sign-in requirement of running cn. You also don't have to type `cn -p` every time, just `cont`. Here's the idea:

```bash
user@pc:~/GitHub/NikoboiNFTB/Shell-Scripts$ cn --config ~/.continue/config.yaml -p "hi"
Hello! How can I help you today?
user@pc:~/GitHub/NikoboiNFTB/Shell-Scripts$ cont "hi"
Hello! How can I help you today?
user@pc:~/GitHub/NikoboiNFTB/Shell-Scripts$ 
```

The script will need to be places into `/usr/local/bin/`.

## Installation

You can install any one of the scripts into any folder by running:

```bash
wget https:/.nikoboi.dev/utils/*
```

>> Fill in the path to the script. [shell.nikoboi.dev](https://shell.nikoboi.dev/) resolves to this repository.

### Power User Tip

Place any script in `/usr/local/bin/` for easy access anywhere:

```bash
sudo mv script /usr/local/bin/script
```

This will allow you to easily run the script as any other Linux command:

```bash
script
```

Very much recommended for scripts you use a lot in many different folders.

#### WARNING

Make sure you don't overwrite anything in `/usr/local/bin/` or that the filename isn't a command:

1. You can easily make sure there isn't a file with the name by running;

```bash
cat /usr/local/bin/script-name
```

2. Or any such command:

```bash
script-name
```
