# SRC
CONF=$(CURDIR)

# FN stands for FILENAME
# DN stands for DIRNAME
NP_ETH1_FN=01-eth1-static.yaml
ROUTING_CONF_DN=routing
ROUTING_SYSD_FN=routing.service

# DST
NPDIR=/etc/netplan
SYSDDIR=/etc/systemd/system


.PHONY: start-eth1 start-routing start
start-eth1: $(CONF)/$(NP_ETH1_FN) $(NPDIR)
	sudo cp $(CONF)/$(NP_ETH1_FN) $(NPDIR)
	sudo netplan apply

start-routing: $(CONF)/$(ROUTING_CONF_DN) $(CONF)/$(ROUTING_SYSD_FN) $(SYSDDIR)
	sudo cp -r $(CONF)/$(ROUTING_CONF_DN) /etc/
	sudo cp $(CONF)/$(ROUTING_SYSD_FN) $(SYSDDIR)
	sudo systemctl enable $(ROUTING_SYSD_FN) 
	sudo systemctl start $(ROUTING_SYSD_FN)

start: start-eth1 start-routing

.PHONY: stop-eth1 stop-routing stop
stop-eth1: $(NPDIR)/$(NP_ETH1_FN)
	sudo rm $(NPDIR)/$(NP_ETH1_FN)
	sudo netplan apply

stop-routing: /etc/$(ROUTING_CONF_DN) $(SYSDDIR)/$(ROUTING_SYSD_FN) 
	sudo systemctl disable $(ROUTING_SYSD_FN) 
	sudo systemctl stop $(ROUTING_SYSD_FN)
	sudo rm -r /etc/$(ROUTING_CONF_DN)
	sudo rm $(SYSDDIR)/$(ROUTING_SYSD_FN)


stop: stop-eth1 stop-routing

status:
	sudo iptables -L -nv
	sudo iptables -L -nv -t nat
	ifconfig eth0 
	ifconfig eth1
	ip route
	sudo systemctl status $(ROUTING_SYSD_FN)
