SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system
.PHONY: install test-install set test-set start test-start
set:
	echo "set-route"
	sudo mkdir $(SYS_ROUTE)
	sudo cp $(CONFIG)/Makefile $(CONFIG)/setting.env $(SYS_ROUTE)/
	sudo cp $(CONFIG)/routing.service $(SYSD)/

test-set:
	echo "test set-route"
	tree $(SYS_ROUTE)
	cat $(SYS_ROUTE)/Makefile
	cat $(SYS_ROUTE)/setting.env
	cat $(SYSD)/routing.service
	sudo iptables -L -nv -t nat
	sudo iptables -L -nv -t filter

start:
	sudo systemctl enable routing.service
	sudo systemctl start routing.service
	sudo systemctl status routing.service

test-start:
	sudo iptables -L -nv -t nat
	sudo iptables -L -nv -t filter


install: set start
test-install: test-set test-start


.PHONY: uninstall test-uninstall stop test-stop unset test-unset
stop:
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true
test-stop:
	sudo iptables -L -nv -t nat
	sudo iptables -L -nv -t filter


unset:
	echo "unset-route"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
test-unset:
	echo "test unset route"
uninstall: stop unset
test-uninstall: test-stop test-unset

