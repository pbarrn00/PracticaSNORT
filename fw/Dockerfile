FROM ubuntu:18.04

RUN apt-get update 

RUN apt-get install -y net-tools iputils-ping traceroute vim iptables iptables-dev pkg-config
    
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sysctl net.ipv4.conf.all.forwarding=1 

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]
