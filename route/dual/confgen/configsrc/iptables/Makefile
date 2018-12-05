include /etc/routing/setting.env
#include $(CURDIR)/setting.env

SHELL = /bin/bash

start:
	sysctl -w net.ipv4.ip_forward=1
	iptables -t nat -P POSTROUTING ACCEPT
	iptables -t filter -P FORWARD ACCEPT
	
	for w in $(WAN1) $(WAN2); do \
		echo "Config iptables rules between $(LAN) and $$w:"; \
		iptables -I POSTROUTING -t nat -o $$w -j MASQUERADE; \
		iptables -A FORWARD -i $$w -o $(LAN) -p tcp --syn -m conntrack --ctstate NEW -j ACCEPT; \
		iptables -A FORWARD -i $$w -o $(LAN) -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT; \
		iptables -A FORWARD -i $(LAN) -o $$w -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT; \
		echo "done."; \
	done

stop:
	for w in $(WAN) $(WAN2); do \
		echo "Restore iptables rules between $(LAN) and $$w:"; \
		iptables -D POSTROUTING -t nat -o $$w -j MASQUERADE; \
		iptables -D FORWARD -i $$w -o $(LAN) -p tcp --syn -m conntrack --ctstate NEW -j ACCEPT; \
		iptables -D FORWARD -i $$w -o $(LAN) -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT; \
		iptables -D FORWARD -i $(LAN) -o $$w -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT; \
	done
	sysctl -w net.ipv4.ip_forward=0
	echo "done."

