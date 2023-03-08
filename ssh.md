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
