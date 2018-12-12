SOURCE=$(CURDIR)/configsrc

.PHONY: config restore showconf
config: $(CONFIG)
	echo "TODO: make conf"
	# config interface
	cp -r $(SOURCE)/* $(CONFIG) || true
	vim $(CONFIG)/interfaces.d/lan

	# according to the ppp-info.yml, generate wan interface, peer files and secrets.
	cp $(CURDIR)/configsrc/ppp-info.yml $(CONFIG)
	vim $(CONFIG)/ppp-info.yml

	python3 -m confgenerator.cli -f $(CONFIG)/ppp-info.yml -d $(CONFIG)

restore: $(CONFIG)
	rm -rf $(CONFIG)

showconf: $(CONFIG)
	cat $(CONFIG)/interfaces
	cat $(CONFIG)/interfaces.d/*
	cat $(CONFIG)/secrets/*
	cat $(CONFIG)/peers/*
