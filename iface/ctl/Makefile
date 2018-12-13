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
	make -C $(CONFGEN) restore CONFIG=$(CONFIG)

.PHONY: test_start test_stop
test_start:
	make -C $(API) test_install
test_stop:
	make -C $(API) test_uninstall

.PHONY: show_runing_conf show_conf
show_running_conf:
	make -C $(API) showconf
show_conf:
	make -C $(CONFGEN) showconf CONFIG=$(CONFIG)
