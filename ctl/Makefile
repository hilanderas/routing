include $(CURDIR)/env
.PHONY: install install-iface install-route config set-iface set-route start-iface start-route
config:
	echo "config OS version, lan, wan"
	sed -i "/ARCH =/c ARCH = $(ARCH)" $(CURDIR)/env

set-iface:
	echo "set-wan"
	echo "set-lan"
	cp $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	cp -r $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	cp -r $(IFACE_CONFIG)/* $(SYS_NET)/

set-route:
	echo "set-route"
	mkdir $(SYS_ROUTE)
	cp $(ROUTE_CONFIG)/Makefile $(ROUTE_CONFIG)/env $(SYS_ROUTE)/
	cp $(ROUTE_CONFIG)/routing.service $(SYSD)/

start-iface:
	echo "You need to reboot to make it work"

start-route:
	systemctl enable routing.service
	systemctl start routing.service
	systemctl status routing.service

install-iface: set-iface start-iface
install-route: set-route start-route

install: config install-iface install-route


.PHONY: uninstall restore uninstall-iface uninstall-route stop-iface stop-route unset-iface unset-route
restore:
	echo "remove configuration"	

stop-iface:
	echo "You need to reboot to make it work"

stop-route:
	systemctl disable routing.service
	systemctl stop routing.service
	systemctl status routing.service

unset-iface:
	echo "unset-wan"
	echo "unset-lan"
	cp $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	cp -r $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d

unset-route:
	echo "unset-route"
	rm -rf $(SYS_ROUTE)
	rm $(SYSD)/routing.service

uninstall-iface: stop-iface unset-iface
uninstall-route: stop-route unset-route

uninstall: uninstall-route uninstall-iface restore
