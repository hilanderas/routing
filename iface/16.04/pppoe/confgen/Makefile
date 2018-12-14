SOURCE=$(CURDIR)/configsrc

.PHONY: config restore showconf
config: $(CONFIG)
	echo "TODO: make conf"
	# config interface
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/interfaces.d/lan
	# according to the ppp-info.yml, generate wan interface, peer files and secrets.
	vim $(CONFIG)/ppp-info.yml
	python3 -m confgenerator.cli -f $(CONFIG)/ppp-info.yml -d $(CONFIG)
test_config: $(CONFIG)
	python3 validator.py -f $(CONFIG)
	python3 validator.py -f $(CONFIG)/interfaces
	python3 validator.py -f $(CONFIG)/interfaces.d/lan
	python3 validator.py -f $(CONFIG)/ppp-info.yaml
	ls $(CONFIG)/interfaces.d/ | grep wan

restore: $(CONFIG)
	rm -rf $(CONFIG)
test_restore:
	python3 validator.py -f $(CONFIG)

showconf: $(CONFIG)
	cat $(CONFIG)/interfaces
	cat $(CONFIG)/interfaces.d/*
	cat $(CONFIG)/secrets/*
	cat $(CONFIG)/peers/*
