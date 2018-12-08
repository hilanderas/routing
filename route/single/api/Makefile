SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system

.PHONY: install set start
set:
	echo "set-route"
	sudo mkdir $(SYS_ROUTE)
	sudo cp $(CONFIG)/Makefile $(CONFIG)/setting.env $(SYS_ROUTE)/
	sudo cp $(CONFIG)/routing.service $(SYSD)/

start:
	sudo systemctl enable routing.service
	sudo systemctl start routing.service
	sudo systemctl status routing.service


install: set start


.PHONY: uninstall stop unset
stop:
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true

unset:
	echo "unset-route"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
uninstall: stop unset

.PHONY: status
status:
	./existed.sh $(SYS_ROUTE)
	./existed.sh $(SYS_ROUTE)/Makefile
	./existed.sh $(SYS_ROUTE)/setting.env
	./existed.sh $(SYSD)/routing.service
	sudo iptables -L -nv -t nat
	sudo iptables -L -nv -t filter

