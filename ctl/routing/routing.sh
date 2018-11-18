#!/bin/bash

source ./env
Print_RED() {
	RED='\033[0;31m'
	NC='\033[0m'
	
	echo -e "${RED} $1 ${NC}"
}

Start() {
    sysctl -w net.ipv4.ip_forward=1
    iptables -t nat -P POSTROUTING ACCEPT
    iptables -I POSTROUTING -t nat -o ${WAN} -j MASQUERADE

    iptables -t filter -P FORWARD ACCEPT
    iptables -A FORWARD -i ${WAN} -o ${LAN} -p tcp --syn -m conntrack --ctstate NEW -j ACCEPT
    iptables -A FORWARD -i ${WAN} -o ${LAN} -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    iptables -A FORWARD -i ${LAN} -o ${WAN} -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
}

Stop() {
    iptables -D POSTROUTING -t nat -o ${WAN} -j MASQUERADE
    iptables -D FORWARD -i ${WAN} -o ${LAN} -p tcp --syn -m conntrack --ctstate NEW -j ACCEPT
    iptables -D FORWARD -i ${WAN} -o ${LAN} -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    iptables -D FORWARD -i ${LAN} -o ${WAN} -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	  sysctl -w net.ipv4.ip_forward=0
}

Usage() {
	Print_RED 'Usage: ./routing.sh { start | stop | status }'
	exit 1
}

Parameter_judge() {
	correct_num="$1"
	real_num="$2"
	if [ $correct_num != $real_num ];then
		Usage
	fi
}

case "$1" in 
    start)
        Parameter_judge 1 $#
        Start
        ;;

    stop)
        Parameter_judge 1 $#
        Stop
        ;;

    *)
        Usage
        ;;
        
esac
