#!/usr/bin/bash

init_port(){
	echo "init net port..."
	iptables-restore < ../conf/iptable-rules.conf
	iptables -L
	iptables -t nat -L
    echo "init iptable-rules finish!!"
}

init_port

echo "-------------------- start Ip4 ip_forward--------------------"
echo "use : sudo vim /etc/sysctl.conf"
echo "net.ipv4.ip_forward=1"
echo "sudo sysctl -p /etc/sysctl.conf"

exit 0
