SOURCE=$(CURDIR)/configsrc

.PHONY: config restore showconf
config: $(CONFIG)
	echo "TODO: make conf"
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/interfaces.d/lan
	vim $(CONFIG)/interfaces.d/wan

restore: $(CONFIG)
	rm -rf $(CONFIG)

showconf: $(CONFIG)
	cat $(CONFIG)/interfaces.d/lan
	cat $(CONFIG)/interfaces.d/wan

