.PHONY: config
config:
	echo "TODO: make conf"
	# config interface
	cp -r $(CURDIR)/configsrc/* $(CONFIG)
	vim $(CONFIG)/interfaces.d/lan

	# according to the ppp-info.yml, generate wan interface, peer files and secrets.
	cp $(CURDIR)/configsrc/ppp-info.yml $(CONFIG)
	vim $(CONFIG)/ppp-info.yml

	python3 -m confgenerator.cli -f $(CONFIG)/ppp-info.yml -d $(CONFIG)
	