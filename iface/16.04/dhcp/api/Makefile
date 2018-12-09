SYS_NET = /etc/network

.PHONY: set
set:
	echo "set-wan"
	echo "set-lan"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	sudo cp -r $(CONFIG)/* $(SYS_NET)/

.PHONY: start
start:
	echo "You need to reboot to make it work"

.PHONY: install
install: set start


.PHONY: stop
stop:
	echo "You need to reboot to make it work"

.PHONY: unset
unset:
	echo "unset-wan"
	echo "unset-lan"
	sudo mv $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d

.PHONY: uninstall
uninstall: unset stop

.PHONY: status
status:
	./existed.sh $(SYS_NET)/interfaces.d
	./existed.sh $(SYS_NET)/interfaces.d/lan
	./existed.sh $(SYS_NET)/interfaces.d/wan
	./existed.sh $(SYS_NET)/interfaces
	./existed.sh $(SYS_NET)/interfaces.d.bk
	./existed.sh $(SYS_NET)/interfaces.bk
	ifconfig

.PHONY: showconf
showconf:
	cat $(SYS_NET)/interfaces.d/lan
	cat $(SYS_NET)/interfaces.d/wan
