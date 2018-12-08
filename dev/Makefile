IFACE = $(CURDIR)/iface
ROUTE = $(CURDIR)/route
CONF = $(CURDIR)/config

.PHONY: config restore start stop
config:
	make -C $(IFACE) -f $(IFACE)/Makefile config CONFIG=$(CONF)/iface
	make -C $(ROUTE) -f $(ROUTE)/Makefile config CONFIG=$(CONF)/route

restore:
	make -C $(IFACE) -f $(IFACE)/Makefile restore CONFIG=$(CONF)/iface
	make -C $(ROUTE) -f $(ROUTE)/Makefile restore CONFIG=$(CONF)/route
	rm -rf $(CONF)

start:
	make -C $(IFACE) -f $(IFACE)/Makefile start CONFIG=$(CONF)/iface
	make -C $(ROUTE) -f $(ROUTE)/Makefile start CONFIG=$(CONF)/route

stop:
	make -C $(IFACE) -f $(IFACE)/Makefile stop
	make -C $(ROUTE) -f $(ROUTE)/Makefile stop

.PHONY: test-config test-restore test-start test-stop
test-config:
	make -C $(IFACE) -f $(IFACE)/Makefile test-config
	make -C $(ROUTE) -f $(ROUTE)/Makefile test-config

test-restore:
	make -C $(IFACE) -f $(IFACE)/Makefile test-restore
	make -C $(ROUTE) -f $(ROUTE)/Makefile test-restore

test-start:
	make -C $(IFACE) -f $(IFACE)/Makefile test-start
	make -C $(ROUTE) -f $(ROUTE)/Makefile test-start

test-stop:
	make -C $(IFACE) -f $(IFACE)/Makefile test-stop
	make -C $(ROUTE) -f $(ROUTE)/Makefile test-stop
