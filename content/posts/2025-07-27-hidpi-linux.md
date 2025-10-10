---
layout: post
title: Linux下多显示器与高分显示器踩坑
subtitle: 
date: 2025-07-27
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - HiDPI
    - linux
    - X11
    - Wayland
---

# 前言
仅做简单记录和对比

# X11 + i3
## 双显示器的切换支持非常好
1. i3 会默认将workspace 1 放在primary显示器上，2放在另一个显示器上，当然你也可以通过i3 config进行自定义的设置，不配置的话，默认行为类似：
```
workspace 1 output <output 1> # <output 1>为你想workspace 1放置的显示器
workspace 2 output <output 1>
```

2. 通过切换workspace在各个显示器间切换时，鼠标也会跟着进行聚焦，非常方便

3. 可以用`arandr`工具进行图形化的配置与指令生成，它是xrandr的一个GUI封装

## 高分(3840x2160)支持一般
1. 通过设置~/.Xresource 里的`Xft.dpi: 192`来进行4K显示器下合适的缩放，但是:
    1. 所有显示器都会使用一样的dpi设置，也就是你的内建显示器如果原本是一个分辩率没那么高的屏幕，字会变得很大
    2. 不是所有应用都遵循一样的缩放原则，比如你可能要单独设置`GDK_SCALE`或`QT_SCALE_FACTOR`等环境变量来指定缩放比例，或者像Firefox/Chromium这样的应用都提供了图形化或者启动时传递参数的办法，指定缩放倍数，如`--force-device-scale-factor=1.5`等等。根据你使用应用所使用的GUI框架，可能要按需设置
    3. 不支持分数缩放(fractional-scaling)或支持得不好

2. 通过`xrandr --output xx --scale 0.5`来进行缩放，全局会放大，但是应用内的渲染，像文字什么的，很可能经是有点糊的


# 如果对高分的设置有较强的需求，可以考虑使用Waylnad
如swaywm, Hyprland等。

Wayland是更先进的图形协议，正在不断发展，老的X11架构支持很有限了。

但是Wayland目前可能还有一些兼容性问题，例如对N卡的驱动支持上面，如果是N卡场景或者是用XWayland进行兼容的话，有时候性能可能还没老的基于C-S架构的X11好，按需使用吧。

# 我的配置文件仓库
https://github.com/ChaosNyaruko/dotfiles
