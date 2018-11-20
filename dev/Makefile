IFACE = $(CURDIR)/iface
ROUTE = $(CURDIR)/route


.PHONY: config restore start stop
config:
	make -C $(IFACE) -f $(IFACE)/Makefile config
	make -C $(ROUTE) -f $(ROUTE)/Makefile config

restore:
	make -C $(IFACE) -f $(IFACE)/Makefile restore
	make -C $(ROUTE) -f $(ROUTE)/Makefile restore

start:
	make -C $(IFACE) -f $(IFACE)/Makefile start
	make -C $(ROUTE) -f $(ROUTE)/Makefile start

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
