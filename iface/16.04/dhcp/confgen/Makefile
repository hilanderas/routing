SHELL = /bin/bash

SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore 
config: $(CONFIG)
	echo -e "\e[96mConfig iface:\e[0m"
	cp -r $(SOURCE)/* $(CONFIG) || true
	echo -e "\e[96mSet lan:\e[0m"
	vim $(CONFIG)/interfaces.d/lan
	echo -e "\e[96mSet wan:\e[0m"
	vim $(CONFIG)/interfaces.d/wan

restore: $(CONFIG)
	echo -e "\e[96mRestore iface:\e[0m"
	rm -rf $(CONFIG)

test_config: $(CONFIG)
	echo -e "\e[96mTest iface config:\e[0m"
	python3 validator.py -f $(CONFIG)/interfaces
	python3 validator.py -f $(CONFIG)/interfaces.d/lan
	python3 validator.py -f $(CONFIG)/interfaces.d/wan

test_restore:
	echo -e "\e[96mTest iface restore:\e[0m"
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf showinfo
showconf: $(CONFIG)
	echo -e "\e[96mShow lan:\e[0m"
	cat $(CONFIG)/interfaces.d/lan
	echo -e "\e[96mShow wan:\e[0m"
	cat $(CONFIG)/interfaces.d/wan
showinfo: $(CONFIG)
	echo -e "\e[96mShow lan:\e[0m"
	cat $(CONFIG)/interfaces.d/lan
	echo -e "\e[96mShow wan:\e[0m"
	cat $(CONFIG)/interfaces.d/wan

