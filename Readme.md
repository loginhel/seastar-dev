# ubuntu开发环境

docker run -e TZ="Asia/Shanghai" --privileged -itd --net=clickhouse --ip="172.26.0.10" --name seastar-dev -p 127.0.0.1:10022:22 -p 9010:9010  registry.cn-shenzhen.aliyuncs.com/hhp_dev/seastar-dev:v0.1 /bin/bash

```
passwd root
vim /etc/ssh/sshd_config
	PasswordAuthentication yes
	PermitRootLogin yes
	UsePAM no
service ssh restart

暂时ubuntu的开发环境没法在xshell中访问！！！折中办法：使用alpine的容器ssh登录跳转 ssh root@172.26.0.10
或者直接在windows下命令行可以访问：ssh root@127.0.0.1 -p 10022

apt list |grep ** 搜索
```

todo: cppzmq安装、drogon安装(需要修改mysql配置)