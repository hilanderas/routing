SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system

.PHONY: install set start
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

start:
	sudo systemctl enable routing.service
	sudo systemctl start routing.service
	sudo systemctl status routing.service
	sudo systemctl enable route_balance.timer
	sudo systemctl start route_balance.timer
	sudo systemctl status route_balance.timer

install: set start

.PHONY: uninstall stop unset
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
unset:
	echo "unset-route"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
	sudo rm $(SYSD)/route_balance.timer
	sudo rm $(SYSD)/route_balance.service

uninstall: stop unset

.PHONY: status
status:
	./existed.sh $(SYS_ROUTE)
	./existed.sh $(SYS_ROUTE)/iproute/Makefile
	./existed.sh $(SYS_ROUTE)/iptables/Makefile
	./existed.sh $(SYS_ROUTE)/setting.env
	./existed.sh $(SYSD)/routing.service
	./existed.sh $(SYSD)/route_balance.service
	./existed.sh $(SYSD)/route_balance.timer
	ip route
	sudo iptables -t nat -S POSTROUTING
	sudo iptables -t filter -S FORWARD
	sudo systemctl status routing.service || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl status route_balance.service || true

.PHONY: showconf
showconf: $(SYS_ROUTE)
	echo "test set-route"
	tree $(SYS_ROUTE)
	sudo cat $(SYS_ROUTE)/iproute/Makefile
	sudo cat $(SYS_ROUTE)/iptables/Makefile
	sudo cat $(SYS_ROUTE)/setting.env
	sudo cat $(SYSD)/route_balance.service
	sudo cat $(SYSD)/route_balance.timer
	sudo cat $(SYSD)/routing.service
