### Git Client配置

配置科学上网后，一般都会有一个本地HTTP代理。为了提升Git Pull的速度，需要给Git Client配置HTTP Proxy。

同时，user和core editor也是很关键的配置。

```
# ~/.gitconfig
[user]
    name = niusmallnan
    mail = niusmallnan@gmail.com
    email = niusmallnan@gmail.com
[core]
    editor = /usr/local/bin/vim
[http]
    proxy = http://127.0.0.1:1087
```
