SHELL = /bin/bash

SYS_NET = /etc/netplan

.PHONY: install set start test_install
set:
	echo -e "\e[96mSet iface\e[0m"
	sudo mkdir $(SYS_NET).routing.bk
	sudo mv $(SYS_NET)/* $(SYS_NET).routing.bk/ || true
	sudo cp -r $(CONFIG)/01-lan.yaml $(SYS_NET)/
	sudo cp -r $(CONFIG)/02-wan.yaml $(SYS_NET)/
start:
	echo -e "\e[96mStart iface\e[0m"
	sudo netplan apply
install: set start
test_install:
	echo -e "\e[96mTest iface install\e[0m"
	python3 validator.py -f $(SYS_NET)
	python3 validator.py -f $(SYS_NET)/01-lan.yaml
	python3 validator.py -f $(SYS_NET)/02-wan.yaml
	python3 validator.py -f $(SYS_NET).routing.bk

.PHONY: uninstall stop unset test_uninstall
stop:
	echo -e "\e[96mStop iface\e[0m"
	sudo netplan apply
unset:
	echo -e "\e[96mUnset iface\e[0m"
	sudo rm $(SYS_NET)/* || true
	sudo cp $(SYS_NET).routing.bk/* $(SYS_NET)/ || true
	sudo rm -rf $(SYS_NET).routing.bk
uninstall: unset stop
test_uninstall:
	echo -e "\e[96mTest iface uninstall\e[0m"
	python3 validator.py -f $(SYS_NET).routing.bk -e
	python3 validator.py -f $(SYS_NET)
	python3 validator.py -f $(SYS_NET)/01-lan.yaml -e
	python3 validator.py -f $(SYS_NET)/02-wan.yaml -e

.PHONY: showconf
showconf: $(SYS_NET)/01-lan.yaml $(SYS_NET)/02-wan.yaml
	echo -e "\e[96mShow lan:\e[0m"
	cat $(SYS_NET)/01-lan.yaml
	echo -e "\e[96mShow wan:\e[0m"
	cat $(SYS_NET)/02-wan.yaml

