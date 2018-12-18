SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore
config: $(CONFIG)
	echo -e "\e[96mConfig iface:\e[0m"
	cp -r $(SOURCE)/* $(CONFIG) || true
	echo -e "\e[96mconfig lan:\e[0m"
	vim $(CONFIG)/01-lan.yaml
	echo -e "\e[96mconfig wan:\e[0m"
	vim $(CONFIG)/02-wan.yaml
test_config:
	echo -e "\e[96mTest iface config:\e[0m"
	python3 validator.py -f $(CONFIG)
	python3 validator.py -f $(CONFIG)/01-lan.yaml
	python3 validator.py -f $(CONFIG)/02-wan.yaml

restore: $(CONFIG)
	echo -e "\e[96mRestore iface:\e[0m"
	rm -rf $(CONFIG)
test_restore:
	echo -e "\e[96mTest iface restore:\e[0m"
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf showinfo
showconf: $(CONFIG)
	echo -e "\e[96mShow lan:\e[0m"
	cat $(CONFIG)/01-lan.yaml
	echo -e "\e[96mShow wan:\e[0m"
	cat $(CONFIG)/02-wan.yaml
showinfo: $(CONFIG)
	echo -e "\e[96mShow lan:\e[0m"
	cat $(CONFIG)/01-lan.yaml
	echo -e "\e[96mShow wan:\e[0m"
	cat $(CONFIG)/02-wan.yaml
