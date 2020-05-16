FROM ubuntu:20.04

RUN cp -ra /etc/apt/sources.list /etc/apt/sources.list.bak

#配置apt-get源
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse\n'\
> /etc/apt/sources.list \
&& apt-get update \
&& apt-get install -y apt-utils \
&& apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata

COPY install-dependencies.sh .

RUN sed -i 's/\r//' install-dependencies.sh \
	&& bash install-dependencies.sh 
	
RUN apt-get install -y git vim openssh-server ctags bzip2 texinfo net-tools