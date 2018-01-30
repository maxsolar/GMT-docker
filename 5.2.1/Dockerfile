FROM ubuntu:xenial
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt install vim gmt gmt-dcw gmt-gshhg -y && \
    echo "cat /etc/motd" >> /root/.bashrc

COPY version /etc/motd

CMD ["/bin/bash","-l"]
