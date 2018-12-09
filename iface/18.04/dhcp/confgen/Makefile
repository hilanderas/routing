.PHONY: config showconf
config: $(CONFIG)
	echo "TODO: make conf"
	cp -r $(CURDIR)/configsrc/* $(CONFIG)
	vim $(CONFIG)/01-lan.yaml
	vim $(CONFIG)/02-wan.yaml

showconf: $(CONFIG)
	cat $(CONFIG)/01-lan.yaml
	cat $(CONFIG)/02-wan.yaml

