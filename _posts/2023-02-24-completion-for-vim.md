---
layout: post
title: 
subtitle: 
date: 2023-02-24
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - vim
    - neovim
    - completion
---
# Start
I have tried several completion schemes in vim/neovim, here is my experience. 

Some cons may due to my lack of familiarity, and have solutions. I'm glad to have your feedback.
# [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)

## Pros
- Almost IDE-like, shipped with many useful funtionalities. 
> YCM also provides semantic IDE-like features in a number of languages, including:
>-  displaying signature help (argument hints) when entering the arguments to a function call (Vim only)
>-  finding declarations, definitions, usages, etc. of identifiers, and an interactive symbol finder
>-  displaying type information for classes, variables, functions etc.,
>-  displaying documentation for methods, members, etc. in the preview window, or in a popup next to the cursor (Vim only)
>-  fixing common coding errors, like missing semi-colons, typos, etc.,
>-  semantic renaming of variables across files,
>-  formatting code,
>-  removing unused imports, sorting imports, etc.

## Cons
Almost perfect, but still have some problems, just for me, for now.
- ~~Version control of the language servers. (How can I use the same binary files with system PATH? Oh I find 'g:ycm_rust_toolchain_root' in FAQ, how about gopls? g:ycm_gopls_binary_path)~~
- I will need to install it by compiling it, which might cause some problems. Thanks to the wonderful documentation, it is not that hard now. Besides I will need a 'python3-supported' vim version, which is not usually shipped with most distros. That means I may need to complie my own vim too. So it may take a long time to install it.
- I have to 'YcmRestartServer' to make the diagnostics/completion work right when I update my dependencies in a project.(I don't know how other alternatives behave, still trying)
- I want to try neovim, and YCM is not offically supported for neovim.

# [Coc.nvim](https://github.com/neoclide/coc.nvim)
Not much experience.
## Pros
- VSCode like, and has its own ecosystems. You can write plugins for coc with ts/js, amazing.
- Easy installation.
## Cons
- Node.js runtime is needed.
- Management of gopls server instance, I don't know if it is fixed now.

# [Neovim built-in lsp with nvim-lspconfig/nvim-cmp/...](https://github.com/neovim/nvim-lspconfig)
## Pros
- Built-in for neovim, less dependencies and more performant in theory.
- Unix-like, atomic, I can configure what to complete easily. (Do not have to read the long documentation). The logic is somehow friendly.
- You can config your own lsp or lsp-like features easily.
## Cons
- Less established.
- With lots of seperated components, I may have to tune it by myself.

