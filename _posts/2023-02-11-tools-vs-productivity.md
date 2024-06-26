---
layout: post
title: “差生文具多”还是“工欲善其事必先利其器”？
subtitle: 
date: 2023-02-11
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - potpourri
---
# 开始
古人云“工欲善其事，必先利其器”，这是啥意思我就不科普了，想必大家都知道。然而现在也有个说法，叫做“差生文具多”，适用的场景包括但不局限于：
- “字面意思”， 上学时成绩一般的学生却有着很多高档或者花里胡哨的文具（这里没有贬低这些同学的意思，成绩说明不了很多问题，只是说明有时存在这个现象）
- 篮球场上的装备党，戴最拉网的装备，挨最重的打🤣
- “立志”于培养自身某个习惯而购买了大量装备，却没有注重于事情本身，例如立志于培养健身习惯的人买了很多装备，像速干衣、专业跑步鞋、办健身卡等，却只有第一次；又例如有的人买了Kindle等电子设备想培养自己的阅读习惯，结果却沦为泡面盖等等。（同样这里可能有用花费来激励自己的结果，有很多人也确实养成了习惯，这里只是提一种典型的现象而已，无冒犯之意）
- ...

其实在很多场景下都有类似的现象，而作为一个菜鸟程序员，自然也在编程或者说计算机工程这个领域中，随着自己经验的增加和深入思考，发现自己或者同行或多或少都有着类似的现象。因此在这里写下自己的一些思考和观点，用以劝诫自己，也欢迎友好的交流。对于我的观点中读者可能不同意的部分，可以在评论区交流，但不接受抬杠和秀优越感，你杠就是你对:)
# 如何看待
本节的阐述会主要辅以编程领域的经典流量密码“最好的编辑器”话题，对我的一些观点进行说法。这个话题其实很有意思，我并不想自诩是一个非常牛逼的程序员，但我认为在这个话题相当一部分的口水都是由那些对各大编辑器的特性不了解的人挑起的，有的甚至都不了解他们观点对立的编辑器特点，就开始各种攻击。虽然这个争论本身并不是本文的重点，但下面以Vim作为主要角色的辅助阐述可能或多或少会涉及到这一点，如果和你的观点不同，希望能够求同存异。
## 要辩证这个问题，不要二极管
这里想说的是“适度”/“中庸”/...，或者很多其他类似的词汇，也是最核心的观点。

Vim以其超强的扩展性而闻名，在这一点在Emacs也是，甚至更甚，但要将他们配置成适合开发一个真实项目的顺手的环境，可能需要自定义很多配置项，而Vim/Emacs所具备的扩展能力其实足够让他们通过配置具备现代IDE的80%甚至全部的功能。

但就我个人而言，我虽然用Vim，但是并没有像很多教程一样，把它配置成一个从界面到功能都和现代IDE相似的环境，因为那在很多场景下不是我想要的，而且要花出非常多的精力，想达到现代IDE的功能可能需要折腾很久，还有很大的维护成本，体验可能还比不上，如果折腾工具并不没有给自己的生产效率带来足够的提升，那大概就是所谓的“差生文具多”了。但

而另一方面Vim/Emacs甚至VSCode的扩展能力和生态是又让我相当热衷于维护一套自己的配置，打磨自己的开发环境和工具，因为这样我就不用因为IDE的更换、开发商的“喂屎”等各种因素，而让自己被迫去记住另一套快捷键，去熟悉另一套操作生态，而这个打磨的过程便是所谓的“工欲善其事，必先利其器”了，也就是我“砍柴”之前所磨的“刀”，只要把握好这个度，不要让磨刀耽误了砍柴，或许便达到了平衡。

## 不要本末倒置，也不要嘲讽你不能理解/和你不致的事情 
- 对于一些人来说，不要光磨刀，不砍柴，比如大多数的程序员，折腾编辑器或许可以取代玩游戏，但最好不要耽误本职工作与正经事儿
- 每个人都自己的想法和追求，不要觉得和你不一样的人就是傻逼/装逼犯，也许他们的工作就不是砍柴，磨刀就是他们的工作，而磨好的刀可以帮助他们做出更好砍柴的工具。有人折腾编程工具是因为他们的乐趣就是这个，或者说他们是为其他程序员提供更棒的工具的人，没有必要说“编程用XXX IDE不香吗，用Vim/Emacs装什么逼呢”，有没有想过你手上所谓好用的IDE正是通过不断的折腾和体验才有目前的形态的吗？退一万步讲，人家就是装逼怎么了，装逼就是能提供情绪价值，在一些场景上甚至因为这个提高生产价值，抨击别人装逼请拿出你自己不装逼的产物，无意义的攻击带不来任务东西，哪怕是满足感
## 合适的场景使用合适的工具
**工具是用来提高生产效率的**
- 登录远程机器你还有IDE可以用吗，修改配置文件等你可能不得不使用一些看起来很古老很不易于使用的工具，vi/vim/nano等等，或者退而求其次使用vscode的remote-ssh功能，但你能确定你的所有环境都能使用吗，例如树莓派、或者能力更弱甚至没有网络环境的嵌入式开发板？vi/vim可能就是你唯一可能的工具，适当“利其器”哪怕只是很基础的设置可能也足够了
- 写Java，据我所知，idea仍然是体验最好的工具
- 数据挖掘/分析，jupyter notebook就是能提供很好的体验
- ...
## 适度折腾，均摊风险
- 使用Vim这类编辑器，你可以自定义一些东西，虽然人的习惯和适应能力很强，但有适配的自由度仍然是很重要的，因为很多默认设置就是很别扭，怎么也习惯不了
- “自由”非常重要，具体可以参考《自由软件，自由社会》这本书，厂商不是慈善家，虽然听起来很不友好，但如果你没有使用自由软件的能力，在被厂商喂屎时就很被动，包括但不局限于免费变收费、涨价、功能阉割、后门等等，你可能因为过高的迁移成本而不得不选择强行吃屎，因此商业软件虽然方便，但我仍然建议保留使用自由软件能力和倾向，尽管多数情况下自由或者开源（开源不等于自由）软件需要更多的折腾。
## 纯文本的力量
这是个题外话，很多商业软件并不提供纯文本的配置方式，这导致了配置同步很多程度上只能依赖于厂商，而纯本文的配置文件，你完全可以使用任何同步方式（私有云/Git等），管理自己不同设备内的对应配置，很方便，通用性也很强
# 备注
- 可能后续会出Vim系列的视频教程，虽然我个人主力使用Vim是在不久之前，使用时间并不长，但确实体会到了这个古老的编辑器所具备的魅力，也希望了解更多技巧，开坑的话我会补充对应的视频链接。
- 我的配置文件可以参考[ChaosNyaruko dotfiles](https://github.com/ChaosNyaruko/dotfiles)，更多是我个人使用，组织得可能不是很好，废配置也比较多😒，有空再整理吧

