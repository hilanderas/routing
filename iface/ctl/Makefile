SETTING = $(CURDIR)/setting.env
include $(SETTING) 

.PHONY: config start stop restore 
config:
	mkdir $(CONFIG)
	make -C $(CONFGEN) -f $(CONFGEN)/Makefile config CONFIG=$(CONFIG)
start:
	make -C $(API) -f $(API)/Makefile install CONFIG=$(CONFIG)
stop:
	make -f $(API)/Makefile uninstall
restore:
	echo "remove configuration"	
	rm -rf $(CONFIG)

.PHONY: test-config test-restore test-start test-stop
test-config: $(CONFIG)
	tree $(CONFIG)
test-restore:
	ls $(CONFIG) || true
test-start:
	make -C $(API) -f $(API)/Makefile test-install CONFIG=$(CONFIG)
test-stop:
	make -C $(API) -f $(API)/Makefile test-uninstall CONFIG=$(CONFIG)
