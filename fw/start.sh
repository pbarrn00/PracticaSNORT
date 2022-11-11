#!/bin/bash

# Habilitamos forwarding
sed -i '/net.ipv4.ip_forward/s/^#//g' /etc/sysctl.conf

# Cambio politicas por defecto
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Permitir trafico de conexiones establecidas o relacionadas para el protocolo TCP
iptables -A FORWARD -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

# Permitir tráfico de conexiones SSH para el protocolo TCP
iptables -A FORWARD -p tcp --dport 22 -i eth1 -s 10.5.0.20 -o eth0 -d 10.5.1.20 -m state --state NEW,ESTABLISHED -j ACCEPT


/usr/sbin/sshd -D
