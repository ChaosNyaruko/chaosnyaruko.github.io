host: 192.168.0.105
mini: 192.168.0.104
# check wsl version
```powershell
wsl --list --verbose
```
# differences
host -> wsl
wsl -> host
outside -> wsl
1. wsl 1

2. wsl 2
hostname -I 172.25.40.24

# a script
```bash
#!/bin/sh
hostip=$(cat /etc/resolv.conf | grep -m 1 nameserver | awk '{print $2}')
wslip=$(hostname -I | awk '{print $1}')
port=10001
hostip=localhost

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
