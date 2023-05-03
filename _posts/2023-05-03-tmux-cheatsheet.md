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
prefix + c: [c]reate a window

# Navigation
prefix + n: go to [n]ext window

prefix + p: go to [p]revious window

prefix + l: go to [l]ast window

prefix + [0-9]: select a specific window

# Split Panes
prefix + " : split horizontally

prefix + % : split vertically

# Kill Panes
prefix + x : kill the current pane

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
prefix + [ : enter copy-mode

prefix + ] : paste the most recent paste buffer

# Others
prefix + , : rename a window

prefix + o : switch between panes.

prefix + z : zoom the active pane

prefix + w : choose a window from a list

prefix + f : search for a pane
# References
1. Check `man tmux` for more details. 
2. Use 'prefix + ?' to list key bindings.
3. [My tmux config file](https://github.com/ChaosNyaruko/dotfiles/blob/main/tmux.conf)
4. Many awesome tmux configurations on GitHub, check it out!
