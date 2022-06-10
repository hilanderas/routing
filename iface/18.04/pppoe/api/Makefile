SHELL = /bin/bash

SYS_NET = /etc/netplan
SYS_PPP = /etc/NetworkManager/system-connections

.PHONY: set_lan set_ppp start install test_install
set_lan:
	echo -e "\e[96mSet interface files:\e[0m"
	sudo mkdir $(SYS_NET).routing.bk
	sudo touch $(SYS_NET)/log
	sudo mv $(SYS_NET)/* $(SYS_NET).routing.bk/ || true
	sudo cp -r $(CONFIG)/01-lan.yaml $(SYS_NET)/

set_ppp:
	echo -e "\e[96mSet pppoe files:\e[0m"
	sudo mkdir $(SYS_PPP).routing.bk
	sudo touch $(SYS_PPP)/log
	sudo mv $(SYS_PPP)/* $(SYS_PPP).routing.bk/ || true
	sudo cp $(CONFIG)/*.nmconnection $(SYS_PPP)/
	sudo chmod 600 $(SYS_PPP)/*.nmconnection
	sudo nmcli connection reload
start:
	echo "\e[93mStart lan!\e[0m"
	sudo netplan apply
	echo "\e[93mStart pppoe!\e[0m"
	sudo nmcli connection up pppoe_home_0
	sudo nmcli connection up pppoe_home_1

install: set_lan set_ppp start
test_install:
	echo -e "\e[96mTest interface files:\e[0m"
	python3 validator.py -f $(SYS_NET).routing.bk
	python3 validator.py -f $(SYS_NET)/01-lan.yaml
	echo -e "\e[96mTest pppoe files:\e[0m"
	python3 validator.py -f $(SYS_PPP).routing.bk
	ls $(SYS_PPP)/
	echo -e "\e[96mShow plog:\e[0m"
	plog || true
	echo -e "\e[96mShow ifconfig:\e[0m"
	ifconfig ppp0 || true
	ifconfig ppp1 || true

.PHONY: stop unset_iface unset_ppp uninstall test_uninstall
stop:
	echo -e "\e[93mStop iface on lan!\e[0m"
	sudo netplan apply
	echo -e "\e[93mStop pppoe on lan!\e[0m"
	sudo nmcli connection down ppp_home_0
	sudo nmcli connection down ppp_home_1

unset_lan:
	echo -e "\e[96mUnset iface\e[0m"
	sudo rm $(SYS_NET)/* || true
	sudo cp $(SYS_NET).routing.bk/* $(SYS_NET)/ || true
	sudo rm -rf $(SYS_NET).routing.bk

unset_ppp:
	echo -e "\e[96mUnset pppoe files:\e[0m"
	sudo rm -r $(SYS_PPP)/*
	sudo cp $(SYS_PPP).routing.bk/* $(SYS_PPP)/ || true
	sudo rm -rf $(SYS_PPP).routing.bk
	sudo nmcli connection reload


uninstall: unset_lan unset_ppp stop
test_uninstall:
	echo -e "\e[96mTest interface files:\e[0m"
	python3 validator.py -f $(SYS_NET).routing.bk -e
	python3 validator.py -f $(SYS_NET)/01-lan.yaml -e
	echo -e "\e[96mTest pppoe files:\e[0m"
	python3 validator.py -f $(SYS_PPP).routing.bk -e
	ls $(SYS_PPP)/
	echo -e "\e[96mShow plog:\e[0m"
	plog || true
	echo -e "\e[96mShow ifconfig:\e[0m"
	ifconfig ppp0 || true
	ifconfig ppp1 || true

.PHONY: showconf
showconf:
	echo -e "\e[96mShow dsl files:\e[0m"
	cat $(SYS_PPP)/*
	echo -e "\e[96mShow interface files:\e[0m"
	cat $(SYS_NET)/*
