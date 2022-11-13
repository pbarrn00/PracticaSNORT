#!/bin/bash

route add default gw 10.5.1.1

route del default gw 10.5.1.254

iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222
#sudo iptables -t nat -A PREROUTING -p tcp --dport 23 -j REDIRECT --to-port 2223
 
/usr/sbin/sshd -D
