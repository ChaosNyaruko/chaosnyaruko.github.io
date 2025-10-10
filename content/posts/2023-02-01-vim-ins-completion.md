---
layout: post
title: Vim's completion behaviour in insert mode
subtitle: simple explanation
date: 2023-02-01
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - vim
---

# 现象
在使用Vim的补全的时候，可能从其他IDE/编辑器过来的同学可能会对Vim在弹出补全菜单后，Tab和Enter的行为感到不理解，例如经常会直接插进一个制表符或者换行回车，这其实是Vim自己在插入模式下补全功能的特殊设计，至于为什么这么设计，那就得问开发者了:)

# 原因
以下摘自Vim的帮助文档 `:help popupmenu-completion`，简单来说就是Vim的插入模式处于补全状态时，其实有3个状态，不同状态下Enter的功能表现是不一样的，而Tab在Vim补全的上下文和Space几乎是一样的，就是插入对应的空格/制表符

> There are three states:
> 1. A complete match has been inserted, e.g., after using CTRL-N or CTRL-P.
> 2. A cursor key has been used to select another match.  The match was not
>    inserted then, only the entry in the popup menu is highlighted.
> 3. Only part of a match has been inserted and characters were typed or the
>    backspace key was used.  The list of matches was then adjusted for what is
>    in front of the cursor.
> 
> In all three states these can be used:
> CTRL-Y		  Yes: Accept the currently selected match and stop completion.
> CTRL-E		  End completion, go back to what was there before selecting a
> 		  match (what was typed or longest common string).
> <PageUp>	  Select a match several entries back, but don't insert it.
> <PageDown>	  Select a match several entries further, but don't insert it.
> <Up>		  Select the previous match, as if CTRL-P was used, but don't
> 		  insert it.
> <Down>		  Select the next match, as if CTRL-N was used, but don't
> 		  insert it.
> <Space> or <Tab>  Stop completion without changing the match and insert the
> 		  typed character.
> 
> The behavior of the <Enter> key depends on the state you are in:
> first state:	  Use the text as it is and insert a line break.
> second state:	  Insert the currently selected match.
> third state:	  Use the text as it is and insert a line break.
> 
> In other words: If you used the cursor keys to select another entry in the
> list of matches then the <Enter> key inserts that match.  If you typed
> something else then <Enter> inserts a line break.

# 建议
Vim的这种设计也许确实让习惯了其他IDE/Editor的小伙伴们难以适应，就个人经验而言，Vim的这种模式其实还是很容易适应的，尤其是你较少使用方向键，手长时间放在home row上时，使用Ctrl-N/P进行上下选择的补全方式可以让你减少一次Enter的击键，习惯了以后其实还是蛮有快感的。

但习惯这种东西毕竟因人而异，如果你确实不习惯这种补全方式，或者你经常多个IDE混合使用，希望能有一致的手感和体验，那我的建议是可以参考一下CoC的设置，其对应的关键builtin函数是 `pumvisible()`，这里我就不班门弄斧了，因为我个人并不是这种使用方式，有兴趣的同学可以在评论区交流:)

```Vimscript
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
```
# 参考
- `:help ins-completion-menu`
- `:help popupmenu-completion`
- `:help pumvisible`
- [coc.nvim](https://github.com/neoclide/coc.nvim)
