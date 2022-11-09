FROM ubuntu:18.04

RUN apt-get update 

RUN apt-get install -y net-tools openssh-server iputils-ping traceroute vim iptables iptables-dev pkg-config nmap tcpdump

RUN mkdir /var/run/sshd

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]
