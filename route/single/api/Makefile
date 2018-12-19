SHELL = /bin/bash

SYS_ROUTE = /etc/routing
SYSD = /etc/systemd/system

.PHONY: set start install test_install
set:
	echo -e "\e[96mSet route:\e[0m"
	sudo mkdir $(SYS_ROUTE)
	sudo cp $(CONFIG)/Makefile $(CONFIG)/setting.env $(SYS_ROUTE)/
	sudo cp $(CONFIG)/routing.service $(SYSD)/
start:
	echo -e "\e[96mStart route:\e[0m"
	sudo systemctl enable routing.service
	sudo systemctl start routing.service
	sudo systemctl status routing.service
install: set start
test_install:
	echo -e "\e[96mTest route install:\e[0m"
	python3 validator.py -f $(SYS_ROUTE)
	python3 validator.py -f $(SYS_ROUTE)/Makefile
	python3 validator.py -f $(SYS_ROUTE)/setting.env
	python3 validator.py -f $(SYSD)/routing.service

	echo -e "\e[96mShow the status of service:\e[0m"
	sudo systemctl status routing.service || true
	
	echo -e "\e[96mShow rules in net POSTROUTING:\e[0m"
	sudo iptables -t nat -S POSTROUTING | grep "MASQUERADE" || true
	echo -e "\e[96mShow rules in filter FORWARD:\e[0m"
	sudo iptables -t filter -S FORWARD | grep "p tcp --syn -m conntrack --ctstate NEW -j ACCEPT" || true
	sudo iptables -t filter -S FORWARD | grep "m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT" || true



.PHONY: stop unset uninstall test_uninstall
stop:
	echo -e "\e[96mStop route:\e[0m"
	sudo systemctl stop routing.service || true
	sudo systemctl disable routing.service || true
	sudo systemctl status routing.service || true
unset:
	echo -e "\e[96mUnset route:\e[0m"
	sudo rm -rf $(SYS_ROUTE)
	sudo rm $(SYSD)/routing.service
uninstall: stop unset
test_uninstall:
	echo -e "\e[96mTest route uninstall:\e[0m"
	python3 validator.py -f $(SYS_ROUTE) -e
	python3 validator.py -f $(SYS_ROUTE)/Makefile -e
	python3 validator.py -f $(SYS_ROUTE)/setting.env -e
	python3 validator.py -f $(SYSD)/routing.service -e

	echo -e "\e[96mShow status of service:\e[0m"
	sudo systemctl status routing.service || true

	echo -e "\e[96mShow rules in net POSTROUTING:\e[0m"
	sudo iptables -t nat -S POSTROUTING | grep "MASQUERADE" || true
	echo -e "\e[96mShow rules in filter FORWARD:\e[0m"
	sudo iptables -t filter -S FORWARD | grep "p tcp --syn -m conntrack --ctstate NEW -j ACCEPT" || true
	sudo iptables -t filter -S FORWARD | grep "m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT" || true


.PHONY: showconf
showconf: $(SYS_ROUTE)
	echo -e "\e[96mShow running configuration:\e[0m"
	echo -e "\e[96m-Makefile:\e[0m"
	cat $(SYS_ROUTE)/Makefile
	echo -e "\e[96m-seting.env:\e[0m"
	cat $(SYS_ROUTE)/setting.env
	echo -e "\e[96m-routing.service:\e[0m"
	cat $(SYSD)/routing.service

