SHELL = /bin/bash

SYS_NET = /etc/network

.PHONY: set
set:
	echo -e "\e[96mSet iface:\e[0m"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.routing.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.routing.bk
	sudo cp -r $(CONFIG)/* $(SYS_NET)/

.PHONY: start
start:
	echo -e "\e[93mStart iface:\e[0m"
	echo -e "\e[93mYou need to reboot to make it work:\e[0m"

.PHONY: install test_install
install: set start

test_install:
	echo -e "\e[96mTest iface install:\e[0m"
	python3 validator.py -f $(SYS_NET)/interfaces.d 
	python3 validator.py -f $(SYS_NET)/interfaces.d/lan
	python3 validator.py -f $(SYS_NET)/interfaces.d/wan
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk

.PHONY: stop
stop:
	echo -e "\e[96mStart iface:\e[0m"
	echo -e "\e[93mYou need to reboot to make it work:\e[0m"

.PHONY: unset
unset:
	echo -e "\e[96mUnset iface:\e[0m"
	sudo mv $(SYS_NET)/interfaces.routing.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.routing.bk $(SYS_NET)/interfaces.d

.PHONY: uninstall test_uninstall
uninstall: unset stop

test_uninstall:
	echo -e "\e[96mTest iface uninstall:\e[0m"
	python3 validator.py -f $(SYS_NET)/interfaces.d 
	python3 validator.py -f $(SYS_NET)/interfaces.d/lan -e
	python3 validator.py -f $(SYS_NET)/interfaces.d/wan -e
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk -e 
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk -e

.PHONY: showconf
showconf:
	echo -e "\e[96mShow lan file:\e[0m"
	cat $(SYS_NET)/interfaces.d/lan
	echo -e "\e[96mShow wan file:\e[0m"
	cat $(SYS_NET)/interfaces.d/wan
