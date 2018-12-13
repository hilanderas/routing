SOURCE=$(CURDIR)/configsrc

.PHONY: config restore showconf
config: $(CONFIG)
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/01-lan.yaml
	vim $(CONFIG)/02-wan.yaml

restore: $(CONFIG)
	rm -rf $(CONFIG)

showconf: $(CONFIG)
	cat $(CONFIG)/01-lan.yaml
	cat $(CONFIG)/02-wan.yaml

