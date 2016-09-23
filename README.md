# Haproxy

### Supported Haproxy versions

There are two dockerfiles in the repo:One is for haproxy 1.6.3 with haproxy files included in this repo; the other one makes it easy for you to build any version of haproxy as it downloads haproxy online. You can changed the haproxy version just by changing the ENV HAPROXY_VERSION to the your desired version.

### How to use this image

This image is simply a base image for you.  There are several ways for you to get started.

#### Create a `Dockerfile`

```dockerfile
FROM softputer/haproxy
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
CMD ["service", "haproxy", "start"]
```

Above is the simplest method to use this image. But in reality, haproxy.cfg is dynamically generated, you have to reload haproxy.cfg every certain time. This is controlled by your program which is executed when your image is started.

For example: your program is a binary named controller.

```reload
FROM softputer/haproxy
COPY controller /
CMD ["/controller"]
```

#### Attention

There are mainly two kinds of haproxy reloading methods. One is to kill all running processes and reload the haproxy.cfg to generate new process. Another do not kill running processes until they are over. You should choose the latter.

If you have any questions about the usage of this image or the configuration of haproxy, you can contact my by email: gyj3023@foxmail.com.
