# docker build -t gmt:5.2.1 .
FROM ubuntu:xenial
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt install vim gmt gmt-dcw gmt-gshhg netcdf-bin -y && \
    echo "cat /etc/motd" >> /root/.bashrc

COPY version /etc/motd
WORKDIR /root/workspace
CMD ["/bin/bash","-l"]
