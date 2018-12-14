SOURCE=$(CURDIR)/configsrc

.PHONY: config restore
config:
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/setting.env

restore:
	rm -rf $(CONFIG)

.PHONY: showconf 
showconf:
	cat $(CONFIG)/setting.env
