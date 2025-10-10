---
layout: post
title: Bulk rename files with Vim
subtitle: 
date: 2023-08-19
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - vim
    - fandom
    - tricks
---

# Unix Shell
## Create list of files
```
\ls | vim -
```
The backslash tells your shell to disregard any aliases for ls; we need plain output with no color. Vim will open, displaying a list of file names.

## Change to list of shell commands

In Vim you now have one file name per line. We need to change each line to be a valid stand-alone shell command.

For example, to rename the files to lowercase:

`:%s/.*/mv -i '&' \L'&'/g`
To append .orig to each file name:

`:%s/.*/mv -i '&' '&.orig'/g`
To change all .JPEG extensions to .jpg:

`:%s/.*/mv -i '&' '&'/g`
`:%s/.JPEG$/.jpg/g`
To remove duplicate extensions:

`:%s/.*/mv -i '&' '&'/g`
`:%s/.jpg.jpg$/.jpg/g`
To substitute certain text in the filename:

`:%s/.*/\="mv -i ".submatch(0)." ".substitute(submatch(0), "foo", "bar", "g")/g`
`\=` is substitute command expression. See VimTip755 for more details.

Note: In case the file name contains space character, it should be surrounded with quotes.

You can use any Vim features here (macros are useful), as long as each line results in a valid shell command.

> for '&'/'\L'/... usage, you can check ":h sub-replace-special" or ":h :s\=" for more.

## Execute the commands
`:w !sh`
The reason this works is Vim writes a file line-by-line. So if you started with a list of 100 file names, it will execute 100 mv commands. Sure there are utilities that may do this better, but Vim is always available and that's one less thing you have to remember.

An alternative method of executing the commands is:

`:% | !bash`
This will pipe the whole buffer to the system command bash, thus executing all of the move commands. This will also replace the file with the command's output, which is useful for commands besides mv. You can also visually select a small subset of lines, and only execute those commands:

`:'<,'>!bash`
Again, this will replace the selected lines with the command's output which can be useful for some commands.

# See also
- renamer.vim plugin to list and rename files
- vidir, emv, qmv external tools which works with vim

# What do I learn from the post?
- the backslash`\ls` to tell your shell to disregard any aliases for ls.
- `:h s/\&`


# References
[orginal post](https://vim.fandom.com/wiki/Bulk_rename_files_with_Vim)
