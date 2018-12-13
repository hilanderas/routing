SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore
config: $(CONFIG) $(SOURCE)
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/setting.env

restore: $(CONFIG) 
	rm -rf $(CONFIG)

test_config: $(CONFIG)
	python3 validator.py -f $(CONFIG)/Makefile
	python3 validator.py -f $(CONFIG)/routing.service
	python3 validator.py -f $(CONFIG)/setting.env

test_restore: $(CONFIG)
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf
showconf: $(CONFIG)
	cat $(CONFIG)/setting.env

