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
status:
	make -C $(API) status

.PHONY: show_running_conf show_conf
show_running_conf:
	make -C $(API) showconf
show_conf:
	make -C $(CONFGEN) showconf
test-config: $(CONFIG)
	tree $(CONFIG)

