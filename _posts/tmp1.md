---
layout: post
title: 工欲善其事，必先利其器
subtitle: 效率命令行工具推荐(1)
date: 2023-03-31
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - TODO-TAG
---

# 防杠声明
工具不是最重要的，最重要的永远是你的idea、核心逻辑和实现（不局限于编程），除非你的工作就是打磨工具本身

# plain text + cli
纯文本是强大的武器，你可以很容易按自己的需求进行格式化/添加删除内容等，不受专有格式的限制

命令行工具，资源占用一般少（主要指前端资源），类UNIX系统一般自带，易脚本化

仅介绍，不介绍深入使用，按需了解，像ls/cp/rm/...什么的99.9%的人都在用的指令就不提了
# tools
## zsh/fish
- zsh大约是bash的超集，但是有更强的能力（补全/高亮等），mac默认带，配合oh-my-zsh等全家桶体验较好
- [fish](https://fishshell.com/)是一个可能更用户友好的shell工具，例如一些oh-my-zsh才有的功能fish都是自带的，且脚本语言更贴近日常使用的编程语言
## tldr
[tldr](https://github.com/tldr-pages/tldr)是一个由社区维护的帮助文档，相比软件自带的help，它旨在提供更“简易”的类cheatsheet式帮助
![tldr](/img/tldr.svg)
## z / autojump
- [z](https://github.com/rupa/z)是用shell编写的“智能跳转”脚本，可以实现自适应的跳转文件夹
- [autojump](https://github.com/wting/autojump)是其用更正统的编程语言写的，功能更强的类似软件，但多数人的使用场景和z差不多，但是各大包管理器有，所以安装可能更直白，按需使用即可
## curl
不多说，超强大的请求发送工具，其实不局限于HTTP/HTTPS，一般我在简易场景下更喜欢用这个而不是Postman之类的图形界面，不是因为curl做不到，而是我懒得查用法了，有ChatGPT或许容易一些🤣
>  curl is a tool for transferring data from or to a server. It supports these protocols:
>       DICT, FILE, FTP, FTPS, GOPHER, GOPHERS, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, MQTT,
>       POP3, POP3S, RTMP, RTMPS, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET or TFTP. The
>       command is designed to work without user interaction.

## date(gnu)
在日期时间操作上非常好用的工具，我最常用的是下面这个，少去用浏览器查询/加载的时间
```bash
date --date='@2147483647'
```
注意mac自带的date与gnu coreutils中date的区别
## fd
[fd](https://github.com/sharkdp/fd)是一个用rust写的find的替代品，具有速度更快、支持更多特性、交互更友好等优点，可与fzf等工具结合
![fd](/img/fd-preview.svg)

## rg
[rg](https://github.com/BurntSushi/ripgrep)是用rust写的基于行的搜索工具，基本是grep的代替品，具有更快、功能更多、默认递归等诸多特性，据说VSCode的默认搜索引擎就是这个
![rg-preview](/img/rg-preview.png)
## fzf
[fzf](https://github.com/junegunn/fzf)是文件“模糊”搜索工具，绝对的神器，和vim等工具配合更是体验上佳
![fzf-preview](/img/fzf-preview.png)

个人使用的最多的功能：
- ctrl-r
- vim + fzf

## tmux (screen)
[tmux](https://github.com/tmux/tmux)是一个很有名的“终端复用器”，和screen类似，但功能更丰富，架构更合理。
- 纯文本配置，.tmux.conf在什么环境都好同步
- 维持会话和后台任务（ssh时不需要nohup等操作）
- 一个界面可以分屏/切换布局等，而且也是不受ssh连接影响的
- 可以纯键盘操作，当然也支持一定程度的鼠标操作，实际使用起来并不违和
## vim
“编辑器之神”， 别的不多说
- 纯文本配置，一套vimrc走天下
- 基础使用其实并没有想象的那么困难，与其他命令行工具配合和谐
- 在各个环境下都能用，不止是vim本身，还包括这个键位 (emacs)
- 各类vim插件
- 开发环境演示(自定义和插件)，各有各的爱好习惯，仅做演示
- grep?

## exa
用rust写的ls的“替代品”，显示结果更友好，特性也更多，但个人用的不算多
![exa-preview](/img/exa-preview.png)

## htop
跨平台的性能监视器，比top更易用
https://htop.dev/
