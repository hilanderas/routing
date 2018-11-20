SYS_NET = /etc/netplan

.PHONY: install test_uninstall set test_set start test_start
set:
	echo "set-wan"
	echo "set-lan"
	mkdir $(SYS_NET).bk
	mv $(SYS_NET)/* $(SYS_NET).bk/
	cp -r $(CONFIG)/01-lan.yaml $(SYS_NET)/
#	cp -r $(CONFIG)/02-wan.yaml $(SYS_NET)/

test-set:
	echo "test set-iface"
	ls $(SYS_NET)/
	cat $(SYS_NET)/*
	ls $(SYS_NET).bk/
	cat $(SYS_NET).bk/*


start:
	netplan apply

test-start:
	ifconfig 

install: set start
test-install: test-set test-start



.PHONY: uninstall test-uninstall stop test_stop unset test_unset
stop:
	netplan apply
test-stop:
	echo "test stop iface"
	ifconfig
unset:
	echo "unset-wan"
	echo "unset-lan"
	rm $(SYS_NET)/*
	cp $(SYS_NET).bk/* $(SYS_NET)/
	rm -rf $(SYS_NET).bk

test-unset:
	echo "test unset iface"
	ls $(SYS_NET)/
	cat $(SYS_NET)/*

uninstall: unset stop
test-uninstall: test-stop test-unset
