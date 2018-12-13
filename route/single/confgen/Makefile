SOURCE=$(CURDIR)/configsrc

.PHONY: config showconf
config:
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/setting.env

showconf: $(CONFIG)
	cat $(CONFIG)/setting.env

