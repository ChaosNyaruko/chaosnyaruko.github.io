---
layout: post
title: How can I access host in WSL?
subtitle: 
date: 2023-03-12
author: ChaosNyaruko
header-img: 
catalog: true
tags:
    - wsl
---

# Introduction
Just my experience for visiting my host(or the services on my host) in a WSL.

# Differences between WSL1 and WSL2
## My Environment
- A mac mini as server, 192.168.0.104/48
- A windows11 laptop, 192.168.0.105/48
- A ubuntu WSL1 on the laptop 
- A debian WSL2 on the laptop

## WSL1
WSL1 uses a "bridged network apapter", which means that it will make it bridged to the host Network Interface Card (NIC) resulting in a unique IP address that will change on restart. So you can access your host by **localhost**.

For example, if you have a proxy running on your host, listening port 1080, then you can set the proxies of Git/cURL/wget/.. as "localhost:1080"/"127.0.0.1:1080". It makes it easy if you want to include it in a script. Also, it will make it easier to access your service in the WSL system too -- just visit it by LAN address (192.168.0.105)

## WSL2
WSL2 uses a Network Address Translation (NAT) service for it's virtual network, which means that you cannot access your host by localhost. However, you can access it by LAN ip adrress. You can even access any hosts on the same LAN as you host machine.

For example, I have a proxy running on my mac mini(192.168.0.104:1080), and my wsl2 get a  "172.25.40.24/20" address (and doesn't have a 192.168.0.xxx/48 address). I CAN access 192.168.0.104:1080 directly on my wsl2 system, and of course the 192.168.0.105:1080 on my host machine. 

Note that you cannot  access your host machine by 172.25.32.1, which is a "nameserver" set in /etc/resolv.conf. I haven't dive into why, but I guess that "172.25.32.1" is only a virtual gateway for wsl2 NAT network, not your real host network.

However, it's a bit more complicated for outsiders to visit your WSL2 services, you will need a "proxy forwarding " to make it work. Besides, WSL 2 distributions currently cannot reach IPv6-only addresses. For more, refer to [Microsoft documentation](https://learn.microsoft.com/en-us/windows/wsl/networking).

# Some operations
## Check your wsl version
```powershell
wsl --list --verbose
```
## Get your wsl/nameserver ip
```bash
hostip=$(cat /etc/resolv.conf | grep -m 1 nameserver | awk '{print $2}')
```
```bash
wslip=$(hostname -I | awk '{print $1}')
```
## Setting a proxy on your wsl by script
```bash
#!/bin/sh
PROXY_HTTP="http://${hostip}:${port}"
PROXY_SOCK5="sock5://${hostip}:${port}"

set_proxy(){
    echo "setting proxy"
    echo ${PROXY_HTTP}
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"

    export https_proxy="${PROXY_HTTP}"
    export HTTPS_PROXY="${PROXY_HTTP}"

    export all_proxy="${PROXY_SOCKS5}"
    export ALL_PROXY="${PROXY_SOCKS5}"
}

unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY

    unset https_proxy
    unset HTTPS_PROXY

    unset all_proxy
    unset ALL_PROXY
}

test_setting(){
    echo "Host ip:" ${hostip}
    echo "WSL ip:" ${wslip}
    echo "Current proxy:" $https_proxy
}

if [ "$1" = "set" ]
then
    set_proxy
elif [ "$1" = "unset" ]
then
    unset_proxy

elif [ "$1" = "test" ]
then 
    test_setting
else
    echo "Unsupported arguments."
fi
```


# Further reading
1. [Microsoft documentation](https://learn.microsoft.com/en-us/windows/wsl/networking)
2. [comparing wsl1 and wsl2](https://learn.microsoft.com/en-us/windows/wsl/compare-versions#comparing-wsl-1-and-wsl-2)
