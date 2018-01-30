FROM ubuntu:precise
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install wget vim gmt -y && \
    echo "cat /etc/motd" >> /root/.bashrc

RUN wget ftp://ftp.iris.washington.edu/pub/gmt/legacy/gshhs-2.1.1-full.tar.bz2 && \
    tar jxf /root/gshhs-2.1.1-full.tar.bz2 -C /tmp && \
    wget ftp://ftp.iris.washington.edu/pub/gmt/legacy/gshhs-2.1.1-high.tar.bz2 && \
    tar jxf /root/gshhs-2.1.1-high.tar.bz2 -C /tmp && \
    rsync -av /tmp/share/coast/ /usr/share/gmt/coast/ && \
    rm -rf /root/*bz2 /tmp/share

COPY version /etc/motd

CMD ["/bin/bash","-l"]
