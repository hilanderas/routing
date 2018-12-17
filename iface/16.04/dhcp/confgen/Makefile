SOURCE=$(CURDIR)/configsrc

.PHONY: config restore test_config test_restore 
config: $(CONFIG)
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/interfaces.d/lan
	vim $(CONFIG)/interfaces.d/wan

restore: $(CONFIG)
	rm -rf $(CONFIG)

test_config: $(CONFIG)
	python3 validator.py -f $(CONFIG)/interfaces
	python3 validator.py -f $(CONFIG)/interfaces.d/lan
	python3 validator.py -f $(CONFIG)/interfaces.d/wan

test_restore:
	python3 validator.py -f $(CONFIG) -e

.PHONY: showconf showinfo
showconf: $(CONFIG)
	cat $(CONFIG)/interfaces.d/lan
	cat $(CONFIG)/interfaces.d/wan
showinfo: $(CONFIG)
	cat $(CONFIG)/interfaces.d/lan
	cat $(CONFIG)/interfaces.d/wan

