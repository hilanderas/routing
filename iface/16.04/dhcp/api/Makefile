SYS_NET = /etc/network

.PHONY: set
set:
	echo "set-wan"
	echo "set-lan"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.routing.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.routing.bk
	sudo cp -r $(CONFIG)/* $(SYS_NET)/

.PHONY: start
start:
	echo "You need to reboot to make it work"

.PHONY: install test_install
install: set start

test_install:
	python3 validator.py -f $(SYS_NET)/interfaces.d 
	python3 validator.py -f $(SYS_NET)/interfaces.d/lan
	python3 validator.py -f $(SYS_NET)/interfaces.d/wan
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk

.PHONY: stop
stop:
	echo "You need to reboot to make it work"

.PHONY: unset
unset:
	echo "unset-wan"
	echo "unset-lan"
	sudo mv $(SYS_NET)/interfaces.routing.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.routing.bk $(SYS_NET)/interfaces.d

.PHONY: uninstall test_uninstall
uninstall: unset stop

test_uninstall:
	python3 validator.py -f $(SYS_NET)/interfaces.d 
	python3 validator.py -f $(SYS_NET)/interfaces.d/lan -e
	python3 validator.py -f $(SYS_NET)/interfaces.d/wan -e
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk -e 
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk -e

.PHONY: showconf
showconf:
	cat $(SYS_NET)/interfaces.d/lan
	cat $(SYS_NET)/interfaces.d/wan
