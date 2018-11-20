SYS_NET = /etc/netplan
.PHONY: install test_uninstall set test_set start test_start
set:
	echo "set-wan"
	echo "set-lan"
	mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	cp -r $(CONFIG)/* $(SYS_NET)/

test-set:
	echo "test set-iface"
	ls $(SYS_NET)/inter*
	tree $(SYS_NET)/interfaces.d
	cat $(SYS_NET)/interfaces.d/lan
	cat $(SYS_NET)/interfaces.d/wan
	cat $(SYS_NET)/interfaces
	tree $(SYS_NET)/interfaces.d.bk
	cat $(SYS_NET)/interfaces.bk

start:
	echo "You need to reboot to make it work"

test-start:
	ifconfig br0
	ifconfig enp2s0

install: set start
test-install: test-set test-start



.PHONY: uninstall test-uninstall stop test_stop unset test_unset
stop:
	echo "You need to reboot to make it work"
test-stop:
	echo "test stop iface"
unset:
	echo "unset-wan"
	echo "unset-lan"
	mv $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	rm -rf $(SYS_NET)/interfaces.d
	mv $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d

test-unset:
	echo "test unset iface"
	ls $(SYS_NET)/inter*
	tree $(SYS_NET)/interfaces.d
	cat $(SYS_NET)/interfaces

uninstall: unset stop
test-uninstall: test-stop test-unset
