# docker build -t gmt:4.2.0 .
FROM maxsolar/ubuntu-hardy
LABEL MAINTAINER='Jim T. Tang<maxubuntu@gmail.com>'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get dist-upgrade -y && \
    apt-get install wget vim wget gmt rsync netcdf-bin -y && \
    echo "cat /etc/motd" >> /root/.bashrc && \
    echo 'export PATH=$PATH:/usr/lib/gmt/bin' >> /root/.bashrc

RUN wget http://ftp.iris.washington.edu/pub/gmt/legacy/gshhs-2.1.1-full.tar.bz2 && \
    tar jxf gshhs-2.1.1-full.tar.bz2 -C /tmp && \
    wget http://ftp.iris.washington.edu/pub/gmt/legacy/gshhs-2.1.1-high.tar.bz2 && \
    tar jxf gshhs-2.1.1-high.tar.bz2 -C /tmp && \
    rsync -av /tmp/share/coast/ /usr/share/gmt/coast/ && \
    rm -rf gshhs*bz2 /tmp/share

COPY version /etc/motd
WORKDIR /root/workspace
CMD ["/bin/bash","-l"]
