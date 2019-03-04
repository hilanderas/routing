IFACE = $(CURDIR)/iface
ROUTE = $(CURDIR)/route
CONF = $(CURDIR)/config
CONFQ = $(CURDIR)/config.queued

.PHONY: config restore start stop restart update_config revert_config
config:
	make -s -f sm.mk is_INIT_CONFGENED && \
	make -s -C $(IFACE) config CONFIG=$(CONFQ)/iface && \
	make -s -C $(ROUTE) config CONFIG=$(CONFQ)/route && \
	make -s -f sm.mk set_CONFGENED

restore:
	make -s -f sm.mk is_CONFGENED && \
	make -s -C $(IFACE) restore CONFIG=$(CONFQ)/iface && \
	make -s -C $(ROUTE) restore CONFIG=$(CONFQ)/route && \
	rm -rf $(CONFQ) && \
	make -s -f sm.mk set_INIT

start:
	make -s -f sm.mk is_CONFGENED && \
	cp -rf $(CONFQ) $(CONF) && \
	make -s -C $(IFACE) start CONFIG=$(CONF)/iface && \
	make -s -C $(ROUTE) start CONFIG=$(CONF)/route && \
	make -s -f sm.mk set_RUNNING

stop:
	make -s -f sm.mk is_RUNNING_CONFQUEUED && \
	make -s -C $(IFACE) stop && \
	make -s -C $(ROUTE) stop && \
	rm -rf $(CONF) && \
	make -s -f sm.mk set_CONFGENED

restart: stop start

update_config: 
	make -s -f sm.mk is_RUNNING_CONFQUEUED && \
	make -s -C $(IFACE) config SOURCE=$(CONFQ)/iface CONFIG=$(CONFQ)/iface && \
	make -s -C $(ROUTE) config SOURCE=$(CONFQ)/route CONFIG=$(CONFQ)/route && \
	make -s -f sm.mk set_CONFQUEUED

revert_config:
	make -s -f sm.mk is_CONFQUEUED && \
	cp -rf $(CONF)/* $(CONFQ)/ && \
	make -s -f sm.mk set_RUNNING

.PHONY: install update uninstall
install: config start
update: update_config restart
uninstall: stop restore

.PHONY: test_state get_state test_INIT test_CONFGENED test_RUNNING test_CONFQUEUED
get_state:
	make -s -f sm.mk get_state

test_state: get_state
	make -s -f sm.mk test_state

test_INIT:
	echo "test init"
	make -s -C $(IFACE) test_restore CONFIG=$(CONFQ)/iface
	make -s -C $(IFACE) test_restore CONFIG=$(CONF)/iface
	make -s -C $(IFACE) test_stop CONFIG=$(CONFQ)/iface

	make -s -C $(ROUTE) test_restore CONFIG=$(CONFQ)/route
	make -s -C $(ROUTE) test_restore CONFIG=$(CONF)/route
	make -s -C $(ROUTE) test_stop CONFIG=$(CONFQ)/route

test_CONFGENED:
	echo "test confgened"
	make -s -C $(IFACE) test_config CONFIG=$(CONFQ)/iface
	make -s -C $(IFACE) test_stop CONFIG=$(CONFQ)/iface

	make -s -C $(ROUTE) test_config CONFIG=$(CONFQ)/route
	make -s -C $(ROUTE) test_stop CONFIG=$(CONFQ)/route

test_RUNNING:
	echo "test running"
	make -s -C $(IFACE) test_config CONFIG=$(CONFQ)/iface
	make -s -C $(IFACE) test_config CONFIG=$(CONF)/iface
	make -s -C $(IFACE) test_start

	make -s -C $(ROUTE) test_config CONFIG=$(CONFQ)/route
	make -s -C $(ROUTE) test_config CONFIG=$(CONF)/route
	make -s -C $(ROUTE) test_start

test_CONFQUEUED:
	echo "test confqueued"
	make -s -C $(IFACE) test_config CONFIG=$(CONFQ)/iface
	make -s -C $(IFACE) test_config CONFIG=$(CONF)/iface
	make -s -C $(IFACE) test_start

	make -s -C $(ROUTE) test_config CONFIG=$(CONFQ)/route
	make -s -C $(ROUTE) test_config CONFIG=$(CONF)/route
	make -s -C $(ROUTE) test_start


.PHONY: showconf show_queued_conf showinfo show_queued_info
showconf:
	make -s -C $(IFACE) show_running_conf
	make -s -C $(ROUTE) show_running_conf

show_queued_conf: $(CONFQ)
	make -s -C $(IFACE) show_conf CONFIG=$(CONFQ)/iface
	make -s -C $(ROUTE) show_conf CONFIG=$(CONFQ)/route

showinfo:
	make -s -C $(IFACE) showinfo CONFIG=$(CONF)/iface
	make -s -C $(ROUTE) showinfo CONFIG=$(CONF)/route

show_queued_info:
	make -s -C $(IFACE) showinfo CONFIG=$(CONFQ)/iface
	make -s -C $(ROUTE) showinfo CONFIG=$(CONFQ)/route