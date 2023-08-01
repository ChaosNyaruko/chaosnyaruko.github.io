---
layout: post
title: Vim or Neovim in 2023?
subtitle: 
date: 2023-08-01
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - vim
    - neovim
---

# Prologue
[Vim](https://www.vim.org/) is one of the most famous based text editors(somehow infamous for serveral reasons). [Neovim](https://neovim.io/) is a really weel-known fork of Vim, which even has its own community. So which one should I choose? It depends on your workflow and usage scenarios. I will introduce the pros and cons of both from my point view. Hope it will help you with the selection.

# Neovim vs Vim
## Neovim Pros/Vim Cons:
- Neovim has better default settings, which means you don't need to "set nocompatible"/"set backspace"/..., see ":h nvim-default" for details in Neovim.
- Neovim has a more open and active community. (Check the "job control" story if you are interested). However, it depends on your attitude towards open source practice.
- Neovim has built-in LSP/treesitter support.
- Neovim makes Meta key available by default.
- Neovim uses Lua as first-class configure language, with high performance Lua-JIT as its engine. Lua is more like a programming language.
- Basicly all plugins written for Vim is available for Neovim, because Vimscript is still supported. The Vimscript engine is reserved.

There are still some others advantages, which I personally don't so much care, see offical website for details.

## Neovim Cons/Vim Pros:
- The open community makes features/apis/plugins/.. not that stable, which means you may have to always deal with break changes.
- Neovim is not installed by default on most unix-like distros, while Vim is more prevalent.
- Neovim's support for old systems may not be so good.
- There are still some differences in APIs and features, which might confuse you if you write your own plugins, or do some personal settings.

# Conclusions
In a word, I recommend Neovim. But for different people, I also have my targeted advice.

1. If you just use vim in very few scenarios, such as fixing some configure files, applying small patches, etc, both are good enough. They don't have so many differences in the editing model.

2. If you want to use one as your main code editor, AND you haven't tried vim-like editors before, I will strongly recommend Neovim.

3. If you are a vim plugin writer, and want to build plugins that can work on both, maybe Vim is better.

4. If you have been using Vim as your code editor, you may give Neovim a try. I believe that this kind of people are able to tell themselves which one is more suitable after some real experience. Maybe you will switch to Neovim, just like me:)

Just try!
