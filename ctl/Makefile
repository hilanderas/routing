SETTING = $(CURDIR)/setting.env
include $(SETTING) 

.PHONY: choose config start stop restore 
choose:
	echo "config OS_VERSION(16.04, 18.04), WAN_MODE(dhcp, pppoe), WAN_NUM"
	mkdir $(CONFIG)
	sed -i "/OS_VERSION =/c OS_VERSION = $(OS_VERSION)" $(SETTING)
	sed -i "/WAN_MODE =/c WAN_MODE = $(WAN_MODE)" $(SETTING)
	cp -r $(SRC_CONFIG)/iface/$(OS_VERSION)/$(WAN_MODE) $(CONFIG)/iface
	cp -r $(SRC_CONFIG)/route $(CONFIG)/route
config:
	make -f config.mk config-$(OS_VERSION)-$(WAN_MODE)
start:
	make -f iface.mk install
	make -f route.mk install
stop:
	make -f route.mk uninstall 
	make -f iface.mk uninstall
restore:
	echo "remove configuration"	
	rm -rf $(CONFIG)

test-start:
	make -f iface.mk test-install
	make -f route.mk test-install
test-stop:
	make -f iface.mk test-uninstall
	make -f route.mk test-uninstall
