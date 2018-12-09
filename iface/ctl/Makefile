SETTING = $(CURDIR)/setting.env
include $(SETTING) 

.PHONY: config start stop restore 
config:
	mkdir -p $(CONFIG)
	make -C $(CONFGEN) config CONFIG=$(CONFIG)
start:
	make -C $(API) install CONFIG=$(CONFIG)
stop:
	make -C $(API) uninstall
restore:
	echo "remove configuration"	
	rm -rf $(CONFIG)

.PHONY: status
status:
	make -C $(API) status 

.PHONY: show_runing_conf show_conf
show_running_conf:
	make -C $(API) showconf
show_conf:
	make -C $(CONFGEN) showconf CONFIG=$(CONFIG)
