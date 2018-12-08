SETTING = $(CURDIR)/setting.env
include $(SETTING) 

.PHONY: config start stop restore 
config:
	mkdir -p $(CONFIG)
	make -C $(CONFGEN) -f $(CONFGEN)/Makefile config CONFIG=$(CONFIG)
start:
	make -C $(API) -f $(API)/Makefile install CONFIG=$(CONFIG)
stop:
	make -f $(API)/Makefile uninstall
restore:
	echo "remove configuration"	
	rm -rf $(CONFIG)

.PHONY: status
	make -C $(API) -f $(API)/Makefile status 
