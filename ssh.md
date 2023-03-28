 ssh username@host -o 'ProxyCommand=nc -x 127.0.0.1:21000 %h %p'

lose data when 301
https://stackoverflow.com/questions/19070801/curl-loses-body-when-a-post-redirected-from-http-to-https

https://wangdoc.com/ssh/port-forwarding 
[this StackOverflow post](https://unix.stackexchange.com/questions/115897/whats-ssh-port-forwarding-and-whats-the-difference-between-ssh-local-and-remot)

```
ssh -vnNTf -R 3001:localhost:3000  username@host -o 'ProxyCommand=nc -x 127.0.0.1:21000 %h %p' -o "ServerAliveInterval=10"
(https://gist.github.com/fnando/1101211)

location /docs/ {
  proxy_pass http://localhost:3001/ # the slash matters
}
```

[go cross compile](https://saekiraku.github.io/article/18577/)


[https://unix.stackexchange.com/questions/470956/how-to-print-all-the-attributes-of-a-zsh-parameter](https://unix.stackexchange.com/questions/470956/how-to-print-all-the-attributes-of-a-zsh-parameter)

echo ${(t)XXXX} to see the type in zsh, (no space between (t) and XXX)

typeset -p XXXX

Variable with no export will not be inherited by subprocesses, even you "source" it.

v=xxx yyyy  v can be inherited by yyyy's subprocesses.

```zsh
v=xxx
yyyy
```
yyyy can't see v

```go
// in main.go
package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	fmt.Println("in shell", os.Getenv("mypath"))
	cmd := exec.Command("zsh", "subprocess.zsh")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		panic(err)
	}
}
```

```zsh
# in test.zsh
mypath="hahah"
echo $mypath

mypath=bbb go run main.go

mypath=aaa
go run main.go
```

```zsh
# subprocess.zsh
echo "Iam a subprocess from main.go, my 'mypath' is: "${mypath}
```

brew leaves > leaves 

brew list --cask > cask
