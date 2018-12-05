SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system
.PHONY: install test-install set test-set start test-start
set:
	echo "set-route"
	sudo mkdir $(SYS_ROUTE) $(SYS_ROUTE)/iproute $(SYS_ROUTE)/iptables
	sudo cp $(CONFIG)/setting.env $(SYS_ROUTE)/
	
	# config ip route
	sudo cp $(CONFIG)/iproute/Makefile $(SYS_ROUTE)/iproute/
	sudo cp $(CONFIG)/iproute/route_balance.service $(SYSD)/
	sudo cp $(CONFIG)/iproute/route_balance.timer $(SYSD)/

	# config iptables
	sudo cp $(CONFIG)/iptables/Makefile $(SYS_ROUTE)/iptables
	sudo cp $(CONFIG)/iptables/routing.service $(SYSD)/

test-set:
	echo "test set-route"
	tree $(SYS_ROUTE)
	cat $(SYS_ROUTE)/iproute/Makefile
	cat $(SYS_ROUTE)/iptables/Makefile
	cat $(SYS_ROUTE)/setting.env
	cat $(SYSD)/route_balance.service
	cat $(SYSD)/route_balance.timer
	cat $(SYSD)/routing.service
	sudo iptables -t nat -S POSTROUTING
	sudo iptables -t filter -S FORWARD
	ip route

start:
	sudo systemctl enable routing.service
	sudo systemctl start routing.service
	sudo systemctl status routing.service
	sudo systemctl enable route_balance.timer
	sudo systemctl start route_balance.timer
	sudo systemctl status route_balance.timer

test-start:
	ip route
	sudo iptables -t nat -S POSTROUTING
	sudo iptables -t filter -S FORWARD
	sudo systemctl status routing.service
	sudo systemctl status route_balance.timer
	sudo systemctl status route_balance.service


install: set start
test-install: test-set test-start


.PHONY: uninstall test-uninstall stop test-stop unset test-unset
stop:
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true
	sudo systemctl stop route_balance.timer || true
	sudo systemctl disable route_balance.timer || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl stop route_balance.service || true
	sudo systemctl disable route_balance.service || true
	sudo systemctl status route_balance.service || true
test-stop:
	sudo systemctl status routing.service || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl status route_balance.service || true
	sudo iptables -t nat -S POSTROUTING
	sudo iptables -t filter -S FORWARD
	ip route

unset:
	echo "unset-route"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
	sudo rm $(SYSD)/route_balance.timer
	sudo rm $(SYSD)/route_balance.service
test-unset:
	echo "test unset route"
uninstall: stop unset
test-uninstall: test-stop test-unset

