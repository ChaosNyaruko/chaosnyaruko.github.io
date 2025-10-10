---
layout: post
title: 
subtitle: 
date: 2023-01-03
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - Python3
    - round
---

今天摸鱼水段子时，在/r/ProgrammerHumor/上发现一个有意思的现象![strange python round](/img/python_round.png)
熟悉Python的同学可能都踩过坑，但我确实是第一次知道这个现象，于是我在本地试了一下，发现确实如此，于是我求助于谷歌，并最终在Python的[官方文档](https://docs.python.org/3.10/library/functions.html#round)里找到了解释

> Return number rounded to ndigits precision after the decimal point. If ndigits is omitted or is None, it returns the nearest integer to its input.
>
> For the built-in types supporting round(), values are rounded to the closest multiple of 10 to the power minus ndigits; if two multiples are equally close, rounding is done toward the even choice (so, for example, both round(0.5) and round(-0.5) are 0, and round(1.5) is 2). Any integer value is valid for ndigits (positive, zero, or negative). The return value is an integer if ndigits is omitted or None. Otherwise, the return value has the same type as number.

其中核心的一段话，我尝试解释一下
> values are rounded to the closest multiple of 10 to the power minus ndigits; if two multiples are equally close, rounding is done toward the even choice 

"the closest multiple of 10 to the power minus ndigits", 说的是最近的**10的负ndigis次方**的倍数，以12.5为例，round(12.5)，ndigits等于0，10的0次方为1，那么离12.5最近的1的倍数为12和13，距离均为0.5，所以python会取偶数的那个舍入值，而不是通常意义上的“四舍五入”，因此普通的*even.5* 的round都会有类似的现象![even round](/img/even_round.png)

另外文档里也提到了，浮点数的round()结果有的时候结果不是数学上预期的那样，这并不是bug，而是计算机在表示十进制小数时固有的缺陷
> Note The behavior of round() for floats can be surprising: for example, round(2.675, 2) gives 2.67 instead of the expected 2.68. This is not a bug: it’s a result of the fact that most decimal fractions can’t be represented exactly as a float. See Floating Point Arithmetic: Issues and Limitations for more information.

