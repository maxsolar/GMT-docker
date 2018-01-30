FROM ubuntu:bionic
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install aptitude wget curl -y && \
    aptitude install gmt=5.4.3+dfsg-1 \
                     gmt-dcw=1.1.3-1 \
                     gmt-gshhg=2.3.7-2 -y

COPY version /etc/motd

CMD ["/bin/bash","-l"]
