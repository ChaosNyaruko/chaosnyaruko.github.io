---
layout: post
title: Enough over Perfect
subtitle: My attitudes towards playing with tools
date: 2023-12-24
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - tools
    - mindset
---
# Introduction
Many people would say that configuring Vim/Emacs(or some other obsession with tools) is time-consuming and even be "a waste of time" [^1]. The core point is that tools are paths to the goal, not the goal itself. Quoted[^2]:
> Obsession with tools is an insidious form of procrastination. This form of resistance masquerades itself as the opposite, as a form of improvement and development. 
It really reveal one of the reasons why some people are obsessed with tools. I quite agree with it (thus I am not an Emacs guy :) ). 

But whether should we look for better tools? In my opinion, Yes, and No.

Yes, we should keep looking for better tools and improve our workflows, that's what tools are made for. And they even bring us more than that.

No, we shouldn't be "obsessed" with them. An "enough" tool is better than a "perfect" tool. 

# Two kinds of "obsession"

## Keeping tweaking the existing one.
This might be popular among "programmers",  the most typical one: editors(Vim/Emacs/...). In fact, for any configurable, even programmable tools, many programmers are ALWAYS trying to find the "perfect" configuration. And maybe I am this kind of guy with Vim.

Configuring/Finding tools are not just for promoting our productivity,  although it might be the most important purpose, they can play a more important role if we can strike the balance,
For me, actually I'm not just configuring the editor. Vim motivates me to dive into many other things. 

I start to try to figure out how things work under the hood, that's what I think tweaking a tool is really for. 
> "Why Curiosity Is Better Than Being Smart? - Durmonski.com" [^3]

I start to leverage the power of regex.

I start to try digging out how a tool/program can interact with others.
- What is LSP and why LSP.
- How is an LSP client implemented
- What is treesitter and why treesitter.
- How fzf.vim works, and how can I  integrate the blazingly fast "ripgrep" into any other tools.
- ...

I start to really participate in an open source program, and read open source code, and then know better software design (extensibility: telescope, nvim-cmp)

I start to think lots of things in different ways.
- Why not "tabs"(the ones you see in VSCode/Sublime).
- Why not "file explorers"
- Why fuzzy searching.
- ...

I start to practice my English for better searching and discussion with others. 
- Writing blogs in English.
- Searching Google/ChatGPT in English, which usually gives me better result. Native English speakers may not suffer from that, but for others, especially Chinese, it's really a pain in the ass :(.
- Not so scared of reading a paper now.
- ...

And So many others things.

I am not exaggerating, playing with Vim brings me more than what I listed, it even somehow makes me a better developer (not just a coder/programmer). Yes, I would admit that it really takes a lot of time, however, "Time you enjoy wasting is not wasted time"[^4].

I'm also trying to strike the balance. My vim configuration is definitely not perfect, it just suits me (or just at some time, suited me).

I somewhat believe "worse is better"[^5]

I can tweak it as my workflow changes, or maybe a thorough refactor at some time. I'm trying to not let it block my formal jobs, or my study plans.
There will never be a "perfect" tool, you can always find a better one, maybe a new one or a better-tweaked one. You are the one that determine how you treat your tools, only yourself really know what you need exactly. But they are not wind from an empty cave, you need to summarize your expeirence, accumulate knowledge, and borrow from others.

## ALWAYS chasing the trends, finding "new" tools.
Thinking that the ones are better ones, a typical example, note taking tools.
I think this kind makes less sense, and I'm not this kind of guy (for now), which somehow makes me look "old-fashioned".
- I'm not playing with Linux GUI and Desktop.
- I'm not using Emacs as an "operating system".
- I'm not using all the fancy note taking software such as Notion, I just use plain text[^6] and sync them by Github.

But I don't just refuse to try them, many new tools have their own unique design, knowing them widen my mind and some good cores can be borrowed. 
Think about the LSP stuff, Visual Code introduced it, and many editors benefit from it, and I benefit from the design, the implentation, etc. I've mentioned it in the previous section.
# Conclusion
"Playing" with tools is not a waste of time, unless you are obsessed with them. We need to strike a balance, and they can bring us more than productivity.

The last post in 2023, Merry Christmas, and Happy New Year! :)

[^1]: https://www.reddit.com/r/productivity/comments/c6q714/dont_obsess_over_tools/
[^2]: https://fadeyev.net/obsession-with-tools/
[^3]: https://durmonski.com/life-advice/curiosity-is-better-than-being-smart/
[^4]: by John Lennon, https://en.wikipedia.org/wiki/John_Lennon
[^5]: https://dreamsongs.com/RiseOfWorseIsBetter.html
[^6]: https://sive.rs/plaintext
