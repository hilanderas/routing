.PHONY: config showconf
config: $(CONFIG)
	echo "TODO: make conf"
	cp -r $(CURDIR)/configsrc/* $(CONFIG)
	vim $(CONFIG)/interfaces.d/lan
	vim $(CONFIG)/interfaces.d/wan
showconf: $(CONFIG)
	cat $(CONFIG)/interfaces.d/lan
	cat $(CONFIG)/interfaces.d/wan
