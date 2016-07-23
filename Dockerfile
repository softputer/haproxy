FROM ubuntu:trusty

MAINTAINER Jayson Ge  <gyj3023@foxmail.com>

ENV HAPROXY_MAJOR=1.6 \
    HAPROXY_VERSION=1.6.3

RUN apt-get update && \
    apt-get install -y build-essential git libpcre3-dev libssl-dev wget curl --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY haproxy-1.6.3.tar.gz  ./

RUN tar zxvf  haproxy-${HAPROXY_VERSION}.tar.gz && \
    rm -f haproxy-${HAPROXY_VERSION}.tar.gz && \
    cd haproxy-${HAPROXY_VERSION}/ && \
    make TARGET=linux2628 USE_STATIC_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 PREFIX=/etc/haproxy && \
    make install PREFIX=/etc/haproxy && \
    cd .. && \
    rm -rf haproxy-${HAPROXY_VERSION}

COPY haproxy /etc/init.d/haproxy

RUN chmod +x /etc/init.d/haproxy

