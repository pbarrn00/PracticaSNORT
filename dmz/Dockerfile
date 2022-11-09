FROM ubuntu:18.04

RUN apt-get update && apt-get install -y net-tools iputils-ping traceroute vim iptables iptables-dev pkg-config tcpdump nmap

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]
