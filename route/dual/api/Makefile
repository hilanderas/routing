SHELL = /bin/bash

SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system

.PHONY: install set start test_install
set:
	echo -e "\e[96mSet route:\e[0m"
	sudo mkdir $(SYS_ROUTE) $(SYS_ROUTE)/iproute $(SYS_ROUTE)/iptables
	sudo cp $(CONFIG)/setting.env $(SYS_ROUTE)/
	
	echo -e "\e[96mSet ip route:\e[0m"
	sudo cp $(CONFIG)/iproute/Makefile $(SYS_ROUTE)/iproute/
	sudo cp $(CONFIG)/iproute/route_balance.service $(SYSD)/
	sudo cp $(CONFIG)/iproute/route_balance.timer $(SYSD)/
	
	echo -e "\e[96mSet iptables:\e[0m"
	sudo cp $(CONFIG)/iptables/Makefile $(SYS_ROUTE)/iptables
	sudo cp $(CONFIG)/iptables/routing.service $(SYSD)/

start:
	echo -e "\e[96mStart route:\e[0m"
	echo -e "\e[96mEnable and start routing.service\e[0m"
	sudo systemctl enable routing.service
	sudo systemctl start routing.service
	sudo systemctl status routing.service

	echo -e "\e[96mEnable and start route_balance.timer\e[0m"
	sudo systemctl enable route_balance.timer
	sudo systemctl start route_balance.timer
	sudo systemctl status route_balance.timer

install: set start

test_install:
	echo -e "\e[96mTest route install:\e[0m"
	python3 validator.py -f $(SYS_ROUTE)
	python3 validator.py -f $(SYS_ROUTE)/iproute/Makefile
	python3 validator.py -f $(SYS_ROUTE)/iptables/Makefile
	python3 validator.py -f $(SYS_ROUTE)/setting.env
	python3 validator.py -f $(SYSD)/routing.service
	python3 validator.py -f $(SYSD)/route_balance.service
	python3 validator.py -f $(SYSD)/route_balance.timer
	
	echo -e "\e[96mShow ip route:\e[0m"
	ip route

	echo -e "\e[96mShow iptables:\e[0m"
	sudo iptables -t nat -L POSTROUTING -nv
	sudo iptables -t filter -L FORWARD -nv

	echo -e "\e[96mShow services status:\e[0m"
	sudo systemctl status routing.service || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl status route_balance.service || true


.PHONY: uninstall stop unset test_uninstall
stop:
	echo -e "\e[96mStop route:\e[0m"
	echo -e "\e[96mStop and disable routing.service:\e[0m"
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true

	echo -e "\e[96mStop and disable router_balance:\e[0m"
	sudo systemctl stop route_balance.timer || true
	sudo systemctl disable route_balance.timer || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl stop route_balance.service || true
	sudo systemctl status route_balance.service || true
unset:
	echo -e "\e[96mUnset route:\e[0m"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
	sudo rm $(SYSD)/route_balance.timer
	sudo rm $(SYSD)/route_balance.service
	sudo systemctl daemon-reload

uninstall: stop unset

test_uninstall:
	echo -e "\e[96mTest route uninstall:\e[0m"
	echo -e "\e[96mTest configuration:\e[0m"
	python3 validator.py -f $(SYS_ROUTE) -e
	python3 validator.py -f $(SYSD)/routing.service -e
	python3 validator.py -f $(SYSD)/route_balance.service -e
	python3 validator.py -f $(SYSD)/route_balance.timer -e
	
	echo -e "\e[96mShow ip route:\e[0m"
	ip route

	echo -e "\e[96mShow iptables:\e[0m"
	sudo iptables -t nat -L POSTROUTING -nv
	sudo iptables -t filter -L FORWARD -nv

	echo -e "\e[96mShow services status:\e[0m"
	sudo systemctl status routing.service || true
	sudo systemctl status route_balance.timer || true
	sudo systemctl status route_balance.service || true


.PHONY: showconf
showconf: $(SYS_ROUTE)
	echo -e "\e[96mShow structure of running configuration:\e[0m"
	tree $(SYS_ROUTE)
	echo -e "\e[96mShow iproute Makefile:\e[0m"
	sudo cat $(SYS_ROUTE)/iproute/Makefile
	echo -e "\e[96mShow iptables Makefile:\e[0m"
	sudo cat $(SYS_ROUTE)/iptables/Makefile
	echo -e "\e[96mShow setting.env:\e[0m"
	sudo cat $(SYS_ROUTE)/setting.env
	echo -e "\e[96mShow route_balance.service\e[0m"
	sudo cat $(SYSD)/route_balance.service
	echo -e "\e[96mShow route_balance.timer\e[0m"
	sudo cat $(SYSD)/route_balance.timer
	echo -e "\e[96mShow routing.service\e[0m"
	sudo cat $(SYSD)/routing.service
