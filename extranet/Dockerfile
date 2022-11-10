FROM ubuntu:18.04

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update 

RUN apt-get install -y net-tools hping3 nano openssh-server iputils-ping traceroute vim iptables iptables-dev pkg-config nmap tcpdump

RUN mkdir /var/run/sshd

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]
