SOURCE=$(CURDIR)/configsrc

.PHONY: config showconf
config: $(CONFIG) $(SOURCE)
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/setting.env

restore: $(CONFIG) $(SOURCE)
	rm -rf $(CONFIG)

showconf: $(CONFIG)
	cat $(CONFIG)/setting.env

