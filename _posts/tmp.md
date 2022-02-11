---
layout: post
title: Using a socks proxy with git for the http transport
subtitle: 
date: 2022-02-11
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - tools
    - git
    - proxy
---
# Global Settings
git config --global http.proxy 'socks5://127.0.0.1:7070'
git config --global --unset http.proxy
# Using Once
ALL_PROXY=socks5://127.0.0.1:8888 git clone https://github.com/some/one.git

