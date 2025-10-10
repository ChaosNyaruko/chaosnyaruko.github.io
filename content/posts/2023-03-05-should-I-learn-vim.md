---
layout: post
title: Should I learn vim in 2023?
subtitle: 
date: 2023-03-05
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - vim
    - programming
---
# Introduction
Vim is one of the most well-known editors(the other one is Emacs), maybe "infamous" for its steep learning curve.

![the famous picture](/img/editor-learning-curves.webp). 

Nowadays there are lots of good editors/IDEs(VS/VSCode/Atom/SublimeText/Jetbrains-series/...) for programmers, so one might ask, should I learn the ancient editor in 2023?

# TL;DR
It depends on your workflow and habits. In general, if you "have to" or "like to" use command-line tools in your workflow, then "yes, you should learn at least basic vi usage". If not, learning vim may not be that helpful, but personally I still recommend you to do that.

# Reasons you should learn
- It is shipped with almost every unix-like distro (vi at least), you can use it out of the box with your muscle memory. It works really well in terminal environment. 
- It is entirely keyboard-based, and you do not need your mouse when typing. It makes people focused on what they do (you don't have to "fetch" the mouse when typing). 
- The design philosophy is so "elegant", and transported to many other editors/IDEs, even just the shortcuts.
- Modern vim/neovim is quite extensible and scriptable, you can get most of the functionalities that you need for programming with plugins, without launching the bloated IDEs.
- It's very "unix-like" itself, for its great combination with other terminal tools, such as make/grep/.... So you can benefit from the tools evolution as well, e.g. grep to ripgrep.
- Some people really enjoy the process of assembling their own editors or other tools. Because they are making products for the customer who they know pretty well -- themselves.

# You should NOT learn vim for these reasons
- For "showing off". It's what you've achieved that are valuable (the products, the business, the bugs you fix, even the happiness you got from the assembly process ), not the tools you use.
- Take too much time with customization, and delay your duties.
- For winning a "faster" argument for a tool.
- For more, refer to the [blog](https://blog.freecloud.dev/2022/08/29/dont-use-vim/) I posted before.

# Those who might really benefit from learning vim
- Those who live in terminals.
- Those who would usually work in unix environments, e.g. Linux server maintainers/backend programmers/...
- Those who always want to improve their workflow, or play with their "own" editors/tools.

# Those For whom vim is not necessary
- Those who are really comfortable with their current editors and workflow, and don't want to change.
- Most frontend programmers (without any discrimination). They rarely depends on the command-line tools, and writing JS/TS code in VSCode is quite comfortable. But the "vim-way" operations is an alternative. 
- Those who can't endure the bordom or unaccustomedness while learing vim.

# Further reading/watching
- [PDE: A different take on editing code](https://www.youtube.com/watch?v=QMVIJhC9Veg)
- [Even the fancy "copilot" is offically supported for Neovim](https://docs.github.com/en/copilot/getting-started-with-github-copilot/getting-started-with-github-copilot-in-neovim)
