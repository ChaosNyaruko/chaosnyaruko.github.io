---
layout: post
title: Lisp之根源 
subtitle: The Roots of Lisp
date: 2024-06-21
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - Lisp
    - 转载
    - repost
    - Paul-Graham
---

[The ORIGINAL post](http://daiyuwen.freeshell.org/gb/rol/roots_of_lisp.html) 

# Abstract
>  约翰麦卡锡于1960年发表了一篇非凡的论文,他在这篇论文中对编程的贡献有如 欧几里德对几何的贡献.1 他向我们展示了,在只给定几个简单的操作符和一个 表示函数的记号的基础上, 如何构造出一个完整的编程语言. 麦卡锡称这种语 言为Lisp, 意为List Processing, 因为他的主要思想之一是用一种简单的数据 结构表(list)来代表代码和数据.

> 值得注意的是,麦卡锡所作的发现,不仅是计算机史上划时代的大事, 而且是一种 在我们这个时代编程越来越趋向的模式.我认为目前为止只有两种真正干净利落, 始终如一的编程模式:C语言模式和Lisp语言模式.此二者就象两座高地, 在它们 中间是尤如沼泽的低地.随着计算机变得越来越强大,新开发的语言一直在坚定地 趋向于Lisp模式. 二十年来,开发新编程语言的一个流行的秘决是,取C语言的计 算模式,逐渐地往上加Lisp模式的特性,例如运行时类型和无用单元收集.

> 在这篇文章中我尽可能用最简单的术语来解释约翰麦卡锡所做的发现. 关键是我 们不仅要学习某个人四十年前得出的有趣理论结果, 而且展示编程语言的发展方 向. Lisp的不同寻常之处--也就是它优质的定义--是它能够自己来编写自己. 为了理解约翰麦卡锡所表述的这个特点,我们将追溯他的步伐,并将他的数学标记 转换成能够运行的Common Lisp代码. 

# Addendum
[Paul Graham原文](/img/the-roots-of-lisp.pdf)
