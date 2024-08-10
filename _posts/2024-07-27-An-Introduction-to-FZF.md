---
layout: post
title: 模糊搜索工具FZF的介绍与个人实践
subtitle: An introduction to FZF and my personal practice.
date: 2024-07-27
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - fzf
    - personal-practice
    - tools
---

# 前言
## 本文是什么
- 终端工具FZF的简单介绍和入门
- 「个人」对此工具的使用和实践，尤其是一些扩展使用方式
- 【矫情】由小及大，怎么联想到一些其他的东西的

## 本文不是什么
- 不是“最佳实践”
	> 「最佳实践」是指在特定领域内经过实践检验并证明具有卓越效果的技术、方法、流程、活动或机制。它们之所以被称为「最佳」，是因为这些实践能够在提高效率、降低成本、提升质量、确保安全、增强客户满意度等方面展现出超越平均水平或现有做法的优势。
	- 这篇文章显然配不上这个称谓
- 不是系统性的使用教程，更不是使用手册
	- [RTFM 😊](https://github.com/junegunn/fzf/blob/master/README.md)
	- [Wiki](https://github.com/junegunn/fzf/wiki)

# [FZF](https://github.com/junegunn/fzf)是什么
1. 基于终端和命令行的工具（CLI）
2. 提供「模糊」搜索的功能（Fuzzy Search）
3. 提供一个简单但直观的TUI （Integrated with Other Tools）

# 基础用法
## 查找文件：直接使用
你可以直接在命令行下面输入对应的命令，`-m`表示多选，默认行为是列出当前文件夹下的所有文件，选中后按回车会把路径/文件名显示在命令行上
```bash
fzf 
```
```bash
fzf -m
```
```bash
vim $(fzf -m)
```
还可以通过环境变量配置预览效果、窗口大小、快捷键等。
因为是环境变量，所以如果在Shell配置文件里将其export，让它被子进程继承，那么所有的相关配置无需重复配置，便可以在子进程（例如Vim中）生效，后面将在Vim集成章节中稍稍展示一下。
典型例子如下（具体含义请参见官方文档）：
- FZF_DEFAULT_COMMAND
- FZF_DEFAULT_OPTS
- FZF_DEFAULT_OPTS_FILE

## 简单语法
fzf支持一套语法（丐版正则），让你能在fuzzy的过程中，还是有一定的搜索效率，以下仅列出部分，更多请参考官方文档

|Token|Match type|Description|
|---|---|---|
|`sbtrkt`|fuzzy-match|Items that match `sbtrkt`|
|`'wild`|exact-match (quoted)|Items that include `wild`|
|`^music`|prefix-exact-match|Items that start with `music`|
|`.mp3$`|suffix-exact-match|Items that end with `.mp3`|
|`!fire`|inverse-exact-match|Items that do not include `fire`|
|`!^music`|inverse-prefix-exact-match|Items that do not start with `music`|
|`!.mp3$`|inverse-suffix-exact-match|Items that do not end with `.mp3`|

# 与Shell集成
## 查看Shell命令历史
使用快捷键Ctrl+R查看Shell命令历史，如果你使用的是原始的bash或者zsh的话，基本可以替换原来的功能，使用起来友好得多；如果你和我一样，主要使用fish，那可能不一定用得上，但我由于个人使用习惯，目前仍然在使用fzf的这个功能，而不是fish自带的那个也蛮好用的历史记录。
<video src="/img/shell-ctrl-r.mov" controls="controls" style="max-width: 730px"></video>


## 补全并搜索
可以设定一个「trigger」，输入后按\<tab\>，可以触发自动补全，补全的内容视你的应用而定：比如你想用vim打开当前文件夹下的某几个文件，就会显示文件列表；你用ssh连接某个远程机器，它会读取你的相关配置，列出你记录好的远程主机信息。如下面示意
注：
1. 这个现在貌似只在zsh、bash中可以用，fish用不了(但fish本身带有类似的功能)
2. 演示中我把trigger从默认的`**`换成了`~~`
<video src="/img/shell-trigger-completion.mov" controls="controls" style="max-width: 730px;"></video>
```bash
vim **<tab>
```
```bash
ssh **<tab> 
```
# 与Vim集成
fzf的作者同样为vim集成fzf写了一个专门的插件[fzf.vim](https://github.com/junegunn/fzf.vim)，这也是我个人使用最多的方式，个人常用的方式如下。为方便演示，我是手动输入的指令，你当然可以为它绑定你想用的快捷键。
## 根据文件名查找文件
<video src="/img/vim-search-file.mov" controls="controls" style="max-width: 730px;"></video>
## 根据文件名和文件内容搜索
<video src="/img/vim-search-file-content.mov" controls="controls" style="max-width: 730px;"></video>
## 搜索Vim中的Buffers/History/Marks/Windows...等等
<video src="/img/vim-fzf-buffers.mov" controls="controls" style="max-width: 730px;"></video>
# 搜索输出（简单）
FZF遵循UNIX的管道Stdin/Stdout的约定。
你可以先执行其他命令，再将它的输出作为FZF的输入，这在某些场景里非常有用，比如你想「筛选」某个列表里的东西，但一时半会儿又记不得它的具体名字，比如搜索进程；同样的，搜索完成后，输出结果可以作为下一个输出，比如将搜索结果记录到某个文件里（便于回溯/diff等）
```bash
ps -ef | fzf
```
```bash
ps -ef | fzf > selected.md
```

# 搜索输出（进阶）
结合FZF的各种选项，它对于「搜索输出」这个特性，还能有更多的扩展用法。
以Git为例，Git也是一个典型的命令行工具，其Stdout输出是有一定格式的。利用这些格式，以及FZF遵循了UNIX的设计约定，可以将Git的输出作为FZF的输入，因此可以有很多的衍生用法。以下举两个我自己在用的例子，你可以参考并衍生更多自己的想法！

注：我知道有Lazygit这样的工具，这里只是一个示意。有的时候，类似Lazygit这样的工具，可能有很多功能你用不上，但有的操作使用原生Git又没有那么方便，你可能只是需要对某个功能很简单的封装，而不是再安装一个工具。
例如你想切换到某个分支，但忘了具体是哪个，需要通过提交历史确认是哪个，再切换过去；又比如，你找到某个变更是在哪个commit提交的，但是记的比较模糊，需要不断尝试
## Git历史查看和搜索
<video src="/img/fzf-git-log.mov" controls="controls" style="max-width: 730px;"></video>

```fish
function glg
    git log --graph --color \
  --format='%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d' \
| fzf \
  --ansi \
  --reverse \
  --no-sort \
  --preview='
    echo {} | grep -o "[a-f0-9]\{7\}" \
    && git show --color $(echo {} | grep -o "[a-f0-9]\{7\}")
  '
end
```
## Git分支查看和切换
<video src="/img/fzf-git-branches.mov" controls="controls" style="max-width: 730px;"></video>
```fish
function gco
    # the quote stuff, see https://fishshell.com/docs/current/fish_for_bash_users.html
    # > Fish has two quoting styles: "" and ''. Variables are expanded in double-quotes, nothing is expanded in single-quotes.
    # > There is no $'', instead the sequences that would transform are transformed when unquoted:
    set separator $(printf "\t")
set git_branches "git branch --all --color \
  --format='%(HEAD) %(color:yellow)%(refname:short)$separator%(color:green)%(committerdate:short)$separator%(color:blue)%(subject)' \
  | column -t -s \\t"
eval "$git_branches" \
| fzf \
  --ansi \
  --reverse \
  --no-sort \
  --preview-label='[ Commits ]' \
  --preview='
    git log $(echo {} \
    | sed "s/^[* ]*//" \
    | awk "{print \$1}") \
    --graph --color \
    --format="%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d"' \
  --bind='alt-c:execute(
    git checkout $(echo {} \
    | sed "s/^[* ]*//" \
    | awk "{print \$1}")
    )' \
  --bind="alt-c:+reload($git_branches)" \
  --bind='enter:execute(
    set branch $(echo {} \
    | sed "s/^[* ]*//" \
    | awk "{print \$1}") \
    && sh -c "git diff --color $branch \
    | less -R"
    )' \
  --header-first \
  --header '
  > ALT C to checkout the branch
  > ENTER to open the diff with less
  '
end
```
# 与自己的工具集成
[ondict](https://github.com/ChaosNyaruko/ondict)是我自己写的词典小工具。当我发现我可能经常需要在「记不清」整个单词/词组拼写的时候，或者单纯只是想少输入几个字母就能查找到，我想到了FZF，因为如[「FZF是什么」]一章所述，它同时提供了「模糊搜索功能」以及一个TUI界面，这极大地减轻了我的工作量，于是将它与自己的工具做了简单的集成，效果如下。
<video src="/img/fzf-ondict-integrated.mov" controls="controls" style="max-width: 730px"></video>
# 更多
我是一个很内耗想很多的人，即使只是一个简单的CLI工具，还是会激起我很多思考。我就这么一列，没有对错，只是我自己的思考和碎碎念。
- Again, UNIX的设计思想。FZF在我看来是一个非常典型的遵循UNIX设计哲学的CLI工具，它只做自己的那部分事情（搜索+选择+TUI），专注于模糊搜索算法/交互的各种优化，但其对Stdin和Stdout约定的遵守，让你能够用它扩展出无数的用法
- 源码阅读（设计模式、文档等等）。FZF是Go语言写的一个CLI工具，尽管由于能力和时间所限，我还没能完全读懂它的所有代码，但它的很多东西都值得我学习，包括但不局限于
	- 一些设计模式和思路，例如对于捕获按键的事件驱动模式
	- 优秀的文档，它的README的信息密度真的很高，我基本只需要看这一个文档就能用得七七八八，对比某些「大厂」的「中文」文档质量，我更愿意花点时间读优秀项目的README和WIKI）
	- 软件工程完整度，包括分发渠道和规范性（连man page一起分发）、兼容性、扩展能力等，在我看来，它比起互联网大厂们所谓的「考虑用户体验」，是更认真、更用心地对待这件事情的
- 复利与可迁移性，一个操作方式可以用在多个地方。FZF是一个基于终端的工具，这意味着当你使用基于终端的其他工具时，你的知识、技能、肌肉记忆是可以迁移的。最典型的，在Vim/Neovim里面使用，你的环境变量/设置的选项/快捷键等等都可以直接生效，甚至Vim本身就是「复利」的典型代表；再比如我上面介绍的Git，Git也是一个基于终端的工具，因此我封装后，对于它那种「模糊」搜索的规律是有一定了解的，有一个隐藏在头脑里的潜意识，提高搜索效率。
- 思考「自己的工具与工作流」。这类工具的使用会让我不断发现或改进适合自己的工作流，这个看起来好像很抽象，我举个具体的例子，在接触FZF这类工具前，我在编辑器中搜索/定位文件非常依赖那个「文件搜索树」，然后我也没觉得有什么不对；接触后，我发现我可以有另外一种搜索方式，而且多数情况下似乎更高效，而且还促使我去思考代码/文章的组织架构是不是合理。不过这些东西并不能让我挣到更多的钱:)


