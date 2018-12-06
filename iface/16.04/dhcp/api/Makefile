SYS_NET = /etc/network
.PHONY: set test-set
set:
	echo "set-wan"
	echo "set-lan"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	sudo cp -r $(CONFIG)/* $(SYS_NET)/
test-set:
	echo "test set-iface"
	ls $(SYS_NET)/inter*
	tree $(SYS_NET)/interfaces.d
	cat $(SYS_NET)/interfaces.d/lan
	cat $(SYS_NET)/interfaces.d/wan
	cat $(SYS_NET)/interfaces
	tree $(SYS_NET)/interfaces.d.bk
	cat $(SYS_NET)/interfaces.bk

.PHONY: start test-start
start:
	echo "You need to reboot to make it work"
test-start:
	ifconfig

.PHONY: install test-install
install: set start
test-install: test-set test-start


.PHONY: stop test-stop
stop:
	echo "You need to reboot to make it work"
test-stop:
	ifconfig

.PHONY: unset test-unset
unset:
	echo "unset-wan"
	echo "unset-lan"
	sudo mv $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d
test-unset:
	echo "test unset iface"
	ls $(SYS_NET)/inter*
	tree $(SYS_NET)/interfaces.d
	cat $(SYS_NET)/interfaces

.PHONY: uninstall test-uninstall
uninstall: unset stop
test-uninstall: test-stop test-unset
