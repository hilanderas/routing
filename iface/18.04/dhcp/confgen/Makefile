SOURCE=$(CURDIR)/configsrc

.PHONY: config restore showconf test_config test_restore
config: $(CONFIG)
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/01-lan.yaml
	vim $(CONFIG)/02-wan.yaml
test_config:
	python3 validator.py -f $(CONFIG)
	python3 validator.py -f $(CONFIG)/$(CONFIG)/01-lan.yaml
	python3 validator.py -f $(CONFIG)/$(CONFIG)/02-wan.yaml

restore: $(CONFIG)
	rm -rf $(CONFIG)
test_restore:
	python3 validator.py -f $(CONFIG) -e

showconf: $(CONFIG)
	cat $(CONFIG)/01-lan.yaml
	cat $(CONFIG)/02-wan.yaml

