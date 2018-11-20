SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system
.PHONY: install test-install set test-set start test-start
set:
	echo "set-route"
	mkdir $(SYS_ROUTE)
	cp $(CONFIG)/Makefile $(CONFIG)/setting.env $(SYS_ROUTE)/
	cp $(CONFIG)/routing.service $(SYSD)/

test-set:
	echo "test set-route"
	tree $(SYS_ROUTE)
	cat $(SYS_ROUTE)/Makefile
	cat $(SYS_ROUTE)/setting.env
	cat $(SYSD)/routing.service
	iptables -L -nv -t nat
	iptables -L -nv -t filter

start:
	systemctl enable routing.service
	systemctl start routing.service
	systemctl status routing.service

test-start:
	iptables -L -nv -t nat
	iptables -L -nv -t filter


install: set start
test-install: test-set test-start


.PHONY: uninstall test-uninstall stop test-stop unset test-unset
stop:
	systemctl stop routing.service || true
	systemctl disable routing.service || true
	systemctl status routing.service || true
test-stop:
	iptables -L -nv -t nat
	iptables -L -nv -t filter


unset:
	echo "unset-route"
	rm -rf $(SYS_ROUTE)
	rm $(SYSD)/routing.service
test-unset:
	echo "test unset route"
uninstall: stop unset
test-uninstall: test-stop test-unset

