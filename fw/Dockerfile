FROM ubuntu:18.04

RUN apt-get update 

RUN apt-get install -y net-tools openssh-server iputils-ping traceroute vim iptables iptables-dev pkg-config autoconf

# Github repo for Snort (https://github.com/mosesrenegade/snort3-docker/blob/master/Dockerfile)
RUN mkdir /var/run/sshd

RUN apt-get update && \
apt-get install -y \
git \
cmake \
hwloc \
libhwloc-dev \
libssl-dev \
openssl \
libluajit-5.1-dev \
libluajit-5.1.2 \
luajit \ 
python-setuptools \
python-pip \
python-dev \
pkg-config \
wget \
build-essential \
bison \
flex \
libpcap-dev \
libpcre3-dev \
libdumbnet-dev \
zlib1g-dev \
iptables-dev \
libnetfilter-queue1 \
tcpdump \
unzip 

RUN mkdir /snort_src && \
cd /snort_src 

# Install LibDAQ
RUN git clone https://github.com/snort3/libdaq.git && \
cd libdaq && \
./bootstrap && \
./configure && \
make && \
make install

# Install Tcmalloc
RUN cd ../ && \
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz && \
tar -xvzf gperftools-2.9.1.tar.gz && \
cd gperftools-2.9.1 && \
./configure && \
make && \
make install

# Install Snort on Ubuntu 18.04
RUN cd ../ && \
wget https://github.com/snort3/snort3/archive/refs/tags/3.1.18.0.tar.gz -O snort3-3.1.18.0.tar.gz && \
tar -xzvf snort3-3.1.18.0.tar.gz && \
cd snort3-3.1.18.0 && \
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc && \
cd build && \
make && \
make install

RUN ldconfig

RUN ln -s /usr/local/bin/snort /usr/sbin/snort

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sysctl net.ipv4.conf.all.forwarding=1 

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]