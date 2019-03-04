SHELL = /bin/bash

SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore
config: $(CONFIG)
	echo -e "\e[96mConfig iface:\e[0m"
	echo -e "\e[96mConfig interface:\e[0m"
	cp -r $(SOURCE)/* $(CONFIG) || true
	rm -r $(CONFIG)/peers || true
	rm -r $(CONFIG)/secrets || true
	vim $(CONFIG)/interfaces.d/lan
	echo -e "\e[96mConfig pppoe:\e[0m"
	vim $(CONFIG)/ppp-info.yml
	python3 -m confgenerator.cli -f $(CONFIG)/ppp-info.yml -d $(CONFIG)
test_config: $(CONFIG)
	echo -e "\e[96mTest iface config:\e[0m"
	echo -e "\e[96mTest interface files:\e[0m"
	python3 validator.py -f $(CONFIG)
	python3 validator.py -f $(CONFIG)/interfaces
	python3 validator.py -f $(CONFIG)/interfaces.d/lan
	ls $(CONFIG)/interfaces.d/ | grep wan
	echo -e "\e[96mTest pppoe info:\e[0m"
	python3 validator.py -f $(CONFIG)/ppp-info.yml

restore: $(CONFIG)
	echo -e "\e[96mRestore iface:\e[0m"
	rm -rf $(CONFIG)
test_restore:
	echo -e "\e[96mTest iface restore:\e[0m"
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf showinfo
showconf: $(CONFIG)
	echo -e "\e[96mShow interface file:\e[0m"
	cat $(CONFIG)/interfaces
	cat $(CONFIG)/interfaces.d/*
	echo -e "\e[96mShow pppoe secret files:\e[0m"
	cat $(CONFIG)/secrets/*
	echo -e "\e[96mShoe provider files:\e[0m"
	cat $(CONFIG)/peers/*
showinfo: $(CONFIG)
	echo -e "\e[96mShow lan:\e[0m"
	cat $(CONFIG)/interfaces.d/lan
	echo -e "\e[96mShow pppoe info:\e[0m"
	cat $(CONFIG)/ppp-info.yml