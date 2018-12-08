IFACE = $(CURDIR)/iface
ROUTE = $(CURDIR)/route
CONF = $(CURDIR)/config

.PHONY: config restore start stop
config:
	make -s -f sm.mk is_INIT && make -C $(IFACE) config CONFIG=$(CONF)/iface && make -C $(ROUTE) config CONFIG=$(CONF)/route && make -s -f sm.mk set_CONFGENED

restore:
	make -s -f sm.mk is_CONFGENED && make -C $(IFACE) restore CONFIG=$(CONF)/iface && make -C $(ROUTE) restore CONFIG=$(CONF)/route && rm -rf $(CONF) && make -s -f sm.mk set_INIT

start:
	make -s -f sm.mk is_CONFGENED && make -C $(IFACE) start CONFIG=$(CONF)/iface && make -C $(ROUTE) start CONFIG=$(CONF)/route && make -s -f sm.mk set_RUNNING

stop:
	make -s -f sm.mk is_RUNNING && make -C $(IFACE) stop && make -C $(ROUTE) stop && make -s -f sm.mk set_CONFGENED

restart: stop start

.PHONY: test_state get_state
test_state: get_state
	tree $(CONF) || true
	make -s -C $(IFACE) status
	make -s -C $(ROUTE) status 

get_state:
	make -s -f sm.mk get_state
