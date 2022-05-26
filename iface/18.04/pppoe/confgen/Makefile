SHELL = /bin/bash

SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore
config: $(CONFIG)
	echo -e "\e[96mConfig interface:\e[0m"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/01-lan.yaml
	echo -e "\e[96mConfig pppoe:\e[0m"
	vim $(CONFIG)/ppp-info.yml
	python3 -m confgenerator.cli -f $(CONFIG)/ppp-info.yml -d $(CONFIG)

test_config: $(CONFIG)
	echo -e "\e[96mTest interface files:\e[0m"
	python3 validator.py -f $(CONFIG)
	python3 validator.py -f $(CONFIG)/01-lan.yaml
	echo -e "\e[96mTest pppoe info:\e[0m"
	python3 validator.py -f $(CONFIG)/ppp-info.yml

restore: $(CONFIG)
	echo -e "\e[96mRestore interface:\e[0m"
	rm -rf $(CONFIG)

test_restore:
	echo -e "\e[96mTest interface restore:\e[0m"
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf showinfo
showconf: $(CONFIG)
	echo -e "\e[96mShow interface file:\e[0m"
	cat $(CONFIG)/01-lan.yaml
	echo -e "\e[96mShow pppoe config files:\e[0m"
	cat $(CONFIG)/*.nmconnection

showinfo: $(CONFIG)
	echo -e "\e[96mShow lan:\e[0m"
	cat $(CONFIG)/01-lan.yaml
	echo -e "\e[96mShow pppoe info:\e[0m"
	cat $(CONFIG)/ppp-info.yml
