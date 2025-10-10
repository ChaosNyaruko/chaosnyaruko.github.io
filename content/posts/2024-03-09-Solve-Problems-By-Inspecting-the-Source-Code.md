---
layout: post
title: An interesting feature/bug about Go testing suite?
subtitle: 
date: 2024-03-09
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - Go
    - debug
    - decrust
---

使用go test -cover的时候发现了一个很有意思的事情，如果被测试函数有
```
coverage: xxxxxx
```
这样的对stdout的输出，那么对应的测试里，最后输出的
```
ok xxxxxx yyyyys coverage: X% of statements
```
中，coverage会被覆盖
谷歌没搜到答案，直接抠Go源码
![](/img/go-test-cover-src1.png)这个out是buf的Bytes，通过![](/img/go-test-cover-src3.png)写入，关键是coveragePercentage这，居然是个非常粗暴的正则匹配
![](/img/go-test-cover-src2.png)
导致了这种被hack的结果
