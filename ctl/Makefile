SETTING = $(CURDIR)/setting.env
include $(SETTING) 

.PHONY: install install-iface install-route config set-iface set-route start-iface start-route
config:
	echo "config OS version, lan, wan"
	sed -i "/ARCH =/c ARCH = $(ARCH)" $(SETTING)

set-iface:
	echo "set-wan"
	echo "set-lan"
	mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	cp -r $(IFACE_CONFIG)/* $(SYS_NET)/

test-set-iface:
	echo "test set-iface"
	ls $(SYS_NET)/inter*
	tree $(SYS_NET)/interfaces.d
	cat $(SYS_NET)/interfaces.d/lan
	cat $(SYS_NET)/interfaces.d/wan
	cat $(SYS_NET)/interfaces
	tree $(SYS_NET)/interfaces.d.bk
	cat $(SYS_NET)/interfaces.bk

set-route:
	echo "set-route"
	mkdir $(SYS_ROUTE)
	cp $(ROUTE_CONFIG)/Makefile $(ROUTE_CONFIG)/setting.env $(SYS_ROUTE)/
	cp $(ROUTE_CONFIG)/routing.service $(SYSD)/

test-set-route:
	echo "test set-route"
	tree $(SYS_ROUTE)
	cat $(SYS_ROUTE)/Makefile
	cat $(SYS_ROUTE)/setting.env
	cat $(SYSD)/routing.service
	iptables -L -nv -t nat
	iptables -L -nv -t filter

start-iface:
	echo "You need to reboot to make it work"

test-start-iface:
	ifconfig br0
	ifconfig enp2s0

start-route:
	systemctl enable routing.service
	systemctl start routing.service
	systemctl status routing.service

test-start-route:
	iptables -L -nv -t nat
	iptables -L -nv -t filter

install-iface: set-iface start-iface
test-install-iface: test-set-iface test-start-iface

install-route: set-route start-route
test-install-route: test-set-route test-start-route

install: config install-iface install-route
test-install: test-install-route test-install-iface


.PHONY: uninstall restore uninstall-iface uninstall-route stop-iface stop-route unset-iface unset-route
restore:
	echo "remove configuration"	

stop-iface:
	echo "You need to reboot to make it work"
test-stop-iface:
	echo "test stop iface"
stop-route:
	systemctl stop routing.service || true
	systemctl disable routing.service || true
	systemctl status routing.service || true
test-stop-route:
	iptables -L -nv -t nat
	iptables -L -nv -t filter
unset-iface:
	echo "unset-wan"
	echo "unset-lan"
	mv $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	rm -rf $(SYS_NET)/interfaces.d
	mv $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d
test-unset-iface:
	echo "test unset iface"
	ls $(SYS_NET)/inter*
	tree $(SYS_NET)/interfaces.d
	cat $(SYS_NET)/interfaces



unset-route:
	echo "unset-route"
	rm -rf $(SYS_ROUTE)
	rm $(SYSD)/routing.service
test-unset-route:
	echo "test unset route"
uninstall-iface: unset-iface stop-iface
test-uninstall-iface: test-stop-iface test-unset-iface
uninstall-route: stop-route unset-route
test-uninstall-route: test-stop-route test-unset-route

uninstall: uninstall-route uninstall-iface restore
test-uninstall: test-uninstall-iface test-uninstall-route
