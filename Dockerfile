# docker build . -t php-cassandra:1.3.2
# docker run -it -v "/media/alexis/Data/git/php-cassandra/build/:/php-cassandra/toHost" php-cassandra:1.3.2 bash
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN apt-get install -y git debhelper php-pear cmake libuv1 libuv1-dev libgmp-dev libssl-dev zlib1g-dev php7.2-dev
RUN git clone https://github.com/AlxVan/php-cassandra.git
WORKDIR php-cassandra/
RUN git submodule update --init --recursive
RUN mkdir /php-cassandra/toHost
# RUN dpkg-buildpackage