#!/bin/bash

# Habilitamos forwarding
sed -i '/net.ipv4.ip_forward/s/^#//g' /etc/sysctl.conf

# Cambio politicas por defecto
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Permitir trafico de conexiones establecidas o relacionadas para el protocolo TCP
iptables -A FORWARD -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT


/usr/sbin/sshd -D
