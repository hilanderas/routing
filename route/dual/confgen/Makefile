SHELL = /bin/bash

SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore
config:
	echo -e "\e[96mConfig route:\e[0m"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/setting.env
test_config:
	echo -e "\e[96mTest route config:\e[0m"
	python3 validator.py -f $(CONFIG)/iproute
	python3 validator.py -f $(CONFIG)/iproute/Makefile
	python3 validator.py -f $(CONFIG)/iproute/route_balance.service
	python3 validator.py -f $(CONFIG)/iproute/route_balance.timer
	python3 validator.py -f $(CONFIG)/iptables/Makefile
	python3 validator.py -f $(CONFIG)/iptables/routing.service
	python3 validator.py -f $(CONFIG)/setting.env

restore:
	echo -e "\e[96mRestore route:\e[0m"
	rm -rf $(CONFIG)
test_restore:
	echo -e "\e[96mTest route restore:\e[0m"
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf showinfo
showconf:
	echo -e "\e[96mShow setting.env:\e[0m"
	cat $(CONFIG)/setting.env
showinfo:
	echo -e "\e[96mShow setting.env:\e[0m"
	cat $(CONFIG)/setting.env