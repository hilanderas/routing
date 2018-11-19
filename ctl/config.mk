SETTING = $(CURDIR)/setting.env
include $(SETTING) 


.PHONY: config-16.04-dhcp
config-16.04-dhcp:
	vim $(IFACE_CONFIG)/interfaces.d/lan
	vim $(IFACE_CONFIG)/interfaces.d/wan
	vim $(ROUTE_CONFIG)/setting.env

