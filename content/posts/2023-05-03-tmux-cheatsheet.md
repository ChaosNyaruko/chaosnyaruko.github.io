---
layout: post
title: tmux cheatsheat
subtitle: 
date: 2023-05-03
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - cheatsheat
    - tmux
---

# Personal Advice
Modify your .tmux.conf file.
1. set -g mouse on
2. change your prefix 


Example conf:
```
set -g mouse on
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
```

# Create Windows
<kbd>prefix + c</kbd>: [c]reate a window

# Navigation
<kbd>prefix + n</kbd>: go to [n]ext window

<kbd>prefix + p</kbd>: go to [p]revious window

<kbd>prefix + l</kbd>: go to [l]ast window

<kbd>prefix + [0-9]</kbd>: select a specific window

# Split Panes
<kbd>prefix + "</kbd> : split horizontally

<kbd>prefix + % </kbd>: split vertically

# Kill Panes
<kbd>prefix + x</kbd>: kill the current pane

You can also type "exit" or press "ctrl-d" instead if you are in a interactive shell

# Copy Mode
You can set mode-keys to 'vi' in order to use the venerable key-bindings.

You can also add some mouse support configuration for easier usage.

Example conf:
```
# To copy, left click and drag to highlight text in yellow, 
# once you release left click yellow text will disappear and will automatically be available in clibboard
# # Use vim keybindings in copy mode
setw -g mode-keys vi
# Update default binding of `Enter` to also use copy-pipe
unbind -T copy-mode-vi Enter
if-shell '[[ $(uname -s) = Linux ]]' { 
   bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard" 
   bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
   bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
} { 
   bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy" 
   bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"
   bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
}
```
<kbd>prefix + [ </kbd>: enter copy-mode

<kbd>prefix + ] </kbd>: paste the most recent paste buffer

# Others
<kbd>prefix + , </kbd>: rename a window

<kbd>prefix + o </kbd>: switch between panes.

<kbd>prefix + z </kbd>: zoom the active pane

<kbd>prefix + w </kbd>: choose a window from a list

<kbd>prefix + f </kbd>: search for a pane
# References
1. Check `man tmux` for more details. 
2. Use <kbd>prefix + ?</kbd> to list key bindings.
3. [My tmux config file](https://github.com/ChaosNyaruko/dotfiles/blob/main/tmux.conf)
4. Many awesome tmux configurations on GitHub, check it out!
