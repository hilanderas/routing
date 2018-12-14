SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore
config:
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/setting.env
test_config:
	python3 validator.py -f $(CONFIG)/iproute
	python3 validator.py -f $(CONFIG)/iproute/Makefile
	python3 validator.py -f $(CONFIG)/iproute/route_balance.service
	python3 validator.py -f $(CONFIG)/iproute/route_balance.timer
	python3 validator.py -f $(CONFIG)/iptables/Makefile
	python3 validator.py -f $(CONFIG)/iptables/routing.service
	python3 validator.py -f $(CONFIG)/setting.env

restore:
	rm -rf $(CONFIG)
test_restore:
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf 
showconf:
	cat $(CONFIG)/setting.env
