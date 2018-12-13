SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system

.PHONY: set start install test_install
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
test_install:
	python3 validator.py -f $(SYS_ROUTE)
	python3 validator.py -f $(SYS_ROUTE)/Makefile
	python3 validator.py -f $(SYS_ROUTE)/setting.env
	python3 validator.py -f $(SYSD)/routing.service

	sudo systemctl status routing.service || true


.PHONY: stop unset uninstall test_uninstall
stop:
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true
unset:
	echo "unset-route"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
uninstall: stop unset
test_uninstall:
	python3 validator.py -f $(SYS_ROUTE) -e
	python3 validator.py -f $(SYS_ROUTE)/Makefile -e
	python3 validator.py -f $(SYS_ROUTE)/setting.env -e
	python3 validator.py -f $(SYSD)/routing.service -e

	sudo systemctl status routing.service || true

	sudo iptables -t nat -S POSTROUTING | grep "MASQUERADE" || true
	sudo iptables -t filter -S FORWARD | grep "p tcp --syn -m conntrack --ctstate NEW -j ACCEPT" || true
	sudo iptables -t filter -S FORWARD | grep "m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT" || true


.PHONY: showconf
showconf: $(SYS_ROUTE)
	cat $(SYS_ROUTE)/Makefile
	cat $(SYS_ROUTE)/setting.env
	cat $(SYSD)/routing.service

