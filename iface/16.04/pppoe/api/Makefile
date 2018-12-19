SHELL = /bin/bash

SYS_NET = /etc/network
SYS_PPP = /etc/ppp

.PHONY: set_iface set_ppp start install test_install
set_iface:
	echo -e "\e[96mSet interface files:\e[0m"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.routing.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.routing.bk
	sudo cp $(CONFIG)/interfaces $(SYS_NET)/
	sudo cp -r $(CONFIG)/interfaces.d $(SYS_NET)/
set_ppp:
	echo -e "\e[96mSet pppoe files:\e[0m"
	sudo mv $(SYS_PPP)/chap-secrets $(SYS_PPP)/chap-secrets.routing.bk
	sudo mv $(SYS_PPP)/pap-secrets $(SYS_PPP)/pap-secrets.routing.bk
	sudo cp $(CONFIG)/secrets/* $(SYS_PPP)/
	sudo mv $(SYS_PPP)/peers $(SYS_PPP)/peers.routing.bk
	sudo cp -r $(CONFIG)/peers $(SYS_PPP)/
start:
	echo -e "\e[96mStart iface:\e[0m"
	echo "\e[93mYou need to reboot to make it work\e[0m"
install: set_iface set_ppp start
test_install:
	echo -e "\e[96mTest interface files:\e[0m"
	python3 validator.py -f $(SYS_NET)/interfaces.d
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk

	echo -e "\e[96mTest pppoe files:\e[0m"
	python3 validator.py -f $(SYS_PPP)/peers
	python3 validator.py -f $(SYS_PPP)/chap-secrets
	python3 validator.py -f $(SYS_PPP)/pap-secrets
	python3 validator.py -f $(SYS_PPP)/peers.routing.bk
	python3 validator.py -f $(SYS_PPP)/chap-secrets.routing.bk
	python3 validator.py -f $(SYS_PPP)/pap-secrets.routing.bk

	echo -e "\e[96mShow plog:\e[0m"
	plog || true

	echo -e "\e[96mShow ifconfig:\e[0m"
	ifconfig ppp0 || true
	ifconfig ppp1 || true

.PHONY: stop unset_iface unset_ppp uninstall test_uninstall
stop:
	echo -e "\e[96mStop iface:\e[0m"
	echo -e "\e[93mYou need to reboot to make it work!\e[0m"
unset_iface:
	echo -e "\e[96mUnset interface files:\e[0m"
	sudo mv $(SYS_NET)/interfaces.routing.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.routing.bk $(SYS_NET)/interfaces.d
unset_ppp:
	echo -e "\e[96mUnset pppoe files:\e[0m"
	sudo rm -r $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/peers.routing.bk $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/chap-secrets.routing.bk $(SYS_PPP)/chap-secrets
	sudo mv $(SYS_PPP)/pap-secrets.routing.bk $(SYS_PPP)/pap-secrets 
uninstall: unset_iface unset_ppp stop
test_uninstall:
	echo -e "\e[96mTest interface files:\e[0m"
	python3 validator.py -f $(SYS_NET)/interfaces.d
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk -e
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk -e

	echo -e "\e[96mTest pppoe files:\e[0m"
	python3 validator.py -f $(SYS_PPP)/peers
	python3 validator.py -f $(SYS_PPP)/chap-secrets
	python3 validator.py -f $(SYS_PPP)/pap-secrets
	python3 validator.py -f $(SYS_PPP)/peers.routing.bk -e
	python3 validator.py -f $(SYS_PPP)/chap-secrets.routing.bk -e
	python3 validator.py -f $(SYS_PPP)/pap-secrets.routing.bk -e

	echo -e "\e[96mShow plog:\e[0m"
	plog || true

	echo -e "\e[96mShow ifconfig:\e[0m"
	ifconfig ppp0 || true
	ifconfig ppp1 || true

.PHONY: showconf
showconf:
	echo -e "\e[96mShow dsl files:\e[0m"
	cat $(SYS_PPP)/peers/*
	echo -e "\e[96mShow secret files:\e[0m"
	cat $(SYS_PPP)/chap-secrets
	cat $(SYS_PPP)/pap-secrets
	echo -e "\e[96mShow interface files:\e[0m"
	cat $(SYS_NET)/interfaces.d/*
