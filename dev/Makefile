IFACE = $(CURDIR)/iface
ROUTE = $(CURDIR)/route
CONF = $(CURDIR)/config
CONFQ = $(CURDIR)/config.queued

.PHONY: config restore start stop restart update_config revert_config
config:
	make -s -f sm.mk is_INIT_CONFGENED && make -C $(IFACE) config CONFIG=$(CONFQ)/iface && make -C $(ROUTE) config CONFIG=$(CONFQ)/route && make -s -f sm.mk set_CONFGENED

restore:
	make -s -f sm.mk is_CONFGENED && make -C $(IFACE) restore CONFIG=$(CONFQ)/iface && make -C $(ROUTE) restore CONFIG=$(CONFQ)/route && rm -rf $(CONFQ) && make -s -f sm.mk set_INIT

start:
	make -s -f sm.mk is_CONFGENED && cp -rf $(CONFQ) $(CONF) && make -C $(IFACE) start CONFIG=$(CONF)/iface && make -C $(ROUTE) start CONFIG=$(CONF)/route && make -s -f sm.mk set_RUNNING

stop:
	make -s -f sm.mk is_RUNNING_CONFQUEUED && make -C $(IFACE) stop && make -C $(ROUTE) stop && rm -rf $(CONF) && make -s -f sm.mk set_CONFGENED

restart: stop start

update_config: 
	make -s -f sm.mk is_RUNNING_CONFQUEUED && make -C $(IFACE) config CONFIG=$(CONFQ)/iface && make -C $(ROUTE) config CONFIG=$(CONFQ)/route && make -s -f sm.mk set_CONFQUEUED

revert_config:
	make -s -f sm.mk is_CONFQUEUED && cp -rf $(CONF)/* $(CONFQ)/ && make -s -f sm.mk set_RUNNING

.PHONY: install update uninstall
install: config start
update: update_config restart
uninstall: stop restore

.PHONY: test_state get_state
test_state: get_state
	tree $(CONFQ) || true
	tree $(CONF) || true
	make -s -C $(IFACE) status
	make -s -C $(ROUTE) status 

get_state:
	make -s -f sm.mk get_state
