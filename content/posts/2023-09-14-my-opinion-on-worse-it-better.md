---
layout: post
title: My opinions on worse-is-better 
subtitle: 
date: 2023-09-14
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - philosophy
    - worse-is-better
---
I got something from ["Worse is Better"](https://dreamsongs.com/RiseOfWorseIsBetter.html)

His example: two famous people, from MIT and Berkeley respectively, once met to discuss operating system issues. The "PC loser-ing" problem. The Berkeley (and Unix) guy , thought the right solution was **"for the system routine to always finish, but sometimes an error code would be returned that signaled that the system routine had failed to complete its action."**, rather than "to back out and restore the user program PC to the instruction that invoked the system routine so that resumption of the user program after the interrupt, for example, re-enters the system routine.". Because "the right thing was too complex.". 

"implementation simplicity was more important than interface simplicity."

Unix and C are the ultimate computer viruses.

The lesson to be learned from this is that it is often undesirable to go for the right thing first. It is better to get half of the right thing available so that it spreads like a virus. Once people are hooked on it, take the time to improve it to 90% of the right thing.

A wrong lesson is to take the parable literally and to conclude that C is the right vehicle for AI software. The 50% solution has to be basically right, and in this case it isn’t.

Maybe we should get things "basically" work first, and then improve them. 

In my opinion:
1. Most people can't tell what is "perfection" and "the right thing".
2. This may make things become de facto standards. (If considered from a business perspective, think about Android/Chrome/iPhone/...

My examples:
- Go programming language.
- 86 Wubi input method.
- Most internet products.
- ...

