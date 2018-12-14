SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system

.PHONY: install set start test_install
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

test_install:
	python3 validator.py -f $(SYS_ROUTE)
	python3 validator.py -f $(SYS_ROUTE)/iproute/Makefile
	python3 validator.py -f $(SYS_ROUTE)/iptables/Makefile
	python3 validator.py -f $(SYS_ROUTE)/setting.env
	python3 validator.py -f $(SYSD)/routing.service
	python3 validator.py -f $(SYSD)/route_balance.service
	python3 validator.py -f $(SYSD)/route_balance.timer
	
	echo "Show ip route"
	ip route

	echo "Show iptables"
	sudo iptables -t nat -L POSTROUTING -nv
	sudo iptables -t filter -L FORWARD -nv

	echo "Show services status"
	sudo systemctl status routing.service || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl status route_balance.service || true


.PHONY: uninstall stop unset test_uninstall
stop:
	echo "Stop routing.service"
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true

	echo "Stop router_balance"
	sudo systemctl stop route_balance.timer || true
	sudo systemctl disable route_balance.timer || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl stop route_balance.service || true
	sudo systemctl status route_balance.service || true
unset:
	echo "unset-route"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
	sudo rm $(SYSD)/route_balance.timer
	sudo rm $(SYSD)/route_balance.service
	sudo systemctl daemon-reload

uninstall: stop unset

test_uninstall:
	python3 validator.py -f $(SYS_ROUTE) -e
	python3 validator.py -f $(SYSD)/routing.service -e
	python3 validator.py -f $(SYSD)/route_balance.service -e
	python3 validator.py -f $(SYSD)/route_balance.timer -e
	
	echo "Show ip route"
	ip route

	echo "Show iptables"
	sudo iptables -t nat -L POSTROUTING -nv
	sudo iptables -t filter -L FORWARD -nv

	echo "Show services status"
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
