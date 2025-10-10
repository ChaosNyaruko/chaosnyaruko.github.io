---
layout: post
title: Why I try fish over zsh
subtitle: 
date: 2023-11-27
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - shell
    - fish
    - zsh
    - tools
---

I've been using zsh as my main shell for years. It works really well, and I love it. But recently, I started to give [fish](https://fishshell.com/) a try, and I found it is great and have set it as my default shell on my Mac. I'm gonna give you my reasons, for your reference.
1. Its autosuggestion and completion functionalities work out of the box, which I would have to download [oh-my-zsh](https://ohmyz.sh/) for zsh. It's nice but annoying to sync between devices. In fish, you don't need any other plugins and settings, they just work. Actually that's the main reason for me, then I can sync my configurations with my [dotfiles](https://github.com/ChaosNyaruko/dotfiles).
2. It is really __friendly__ for configuration. I'm not a great hacker and not the kind of guy who wants to dive in everything. Fish offer a web-based config interface. You can invoke it by typing `fish_config` in the shell, then you can configure your shell by clicking the UI, AND the changes you make are essentially text in several files, which you can carry them with whatever your sync system is.
3. Zsh is strong and nice, but some of its syntax and concepts(some inherited from the older sh/bash) are really hard to understand. For example, "variable substitution" or the "$@/$?/..." stuff. I don't think they are human-readable. Fish shell language, however, is more like a modern programming language, with better documentation(type `help` in fish, you will also get a web-based doc!)

But I'm not saying that I will use fish ONLY and FOREVER. Zsh is also great and better for some scenarios, so here are my opinions about what kind of people may want to use zsh, even bash.
1. You are a server administrator, and you spend most of your time tuning your online machines by shell scripts. The servers might only be shipped with only bash/sh/zsh/... shell.
2. You don't need extra functionalities for shells and you don't write many shell scripts, the basic completion, export, alias, etc thingummies are just enough.
3. You want to practice your shell skill, so that you can have the same way interacting with online servers occasionally. This one is also my reason of using zsh at first.


In general, fish may be better for personal usage and works well on your personal computers, while the classic shells(sh/bash/zsh/...) are better for online servers. Hope this article can help you with the choice.
