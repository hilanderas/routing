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

test-config: $(CONFIG)
	tree $(CONFIG)

test-restore:
	ls $(CONFIG) || true
test-start:
	make -f -C $(API) $(API)/Makefile test-install
test-stop:
	make -f -C $(API) $(API)/Makefile test-uninstall
