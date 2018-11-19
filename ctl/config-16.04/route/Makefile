include $(CURDIR)/env


start:
	sysctl -w net.ipv4.ip_forward=1
	iptables -t nat -P POSTROUTING ACCEPT
	iptables -I POSTROUTING -t nat -o $(WAN) -j MASQUERADE
	iptables -t filter -P FORWARD ACCEPT
	iptables -A FORWARD -i $(WAN) -o $(LAN) -p tcp --syn -m conntrack --ctstate NEW -j ACCEPT
	iptables -A FORWARD -i $(WAN) -o $(LAN) -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	iptables -A FORWARD -i $(LAN) -o $(WAN) -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

stop:
	iptables -D POSTROUTING -t nat -o $(WAN) -j MASQUERADE
	iptables -D FORWARD -i $(WAN) -o $(LAN) -p tcp --syn -m conntrack --ctstate NEW -j ACCEPT
	iptables -D FORWARD -i $(WAN) -o $(LAN) -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	iptables -D FORWARD -i $(LAN) -o $(WAN) -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	sysctl -w net.ipv4.ip_forward=0

