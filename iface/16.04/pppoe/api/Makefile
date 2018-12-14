SYS_NET = /etc/network
SYS_PPP = /etc/ppp

.PHONY: set_iface set_ppp start install test_install
set_iface:
	echo "set-wan"
	echo "set-lan"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.routing.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.routing.bk
	sudo cp $(CONFIG)/interfaces $(SYS_NET)/
	sudo cp -r $(CONFIG)/interfaces.d $(SYS_NET)/
set_ppp:
	echo "set-ppp"
	sudo mv $(SYS_PPP)/chap-secrets $(SYS_PPP)/chap-secrets.routing.bk
	sudo mv $(SYS_PPP)/pap-secrets $(SYS_PPP)/pap-secrets.routing.bk
	sudo cp $(CONFIG)/secrets/* $(SYS_PPP)/
	sudo mv $(SYS_PPP)/peers $(SYS_PPP)/peers.routing.bk
	sudo cp -r $(CONFIG)/peers $(SYS_PPP)/
start:
	echo "You need to reboot to make it work"
install: set_iface set_ppp start
test_install:
	echo "Test interface files"
	python3 validator.py -f $(SYS_NET)/interfaces.d
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk

	echo "Test pppoe files"
	python3 validator.py -f $(SYS_PPP)/peers
	python3 validator.py -f $(SYS_PPP)/chap-secrets
	python3 validator.py -f $(SYS_PPP)/pap-secrets
	python3 validator.py -f $(SYS_PPP)/peers.routing.bk
	python3 validator.py -f $(SYS_PPP)/chap-secrets.routing.bk
	python3 validator.py -f $(SYS_PPP)/pap-secrets.routing.bk

	echo "Show plog"
	plog || true

	echo "Show ifconfig"
	ifconfig ppp0 || true
	ifconfig ppp1 || true

.PHONY: stop unset_iface unset_ppp uninstall test_uninstall
stop:
	echo "You need to reboot to make it work"
unset_iface:
	sudo mv $(SYS_NET)/interfaces.routing.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.routing.bk $(SYS_NET)/interfaces.d
unset_ppp:
	sudo rm -r $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/peers.routing.bk $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/chap-secrets.routing.bk $(SYS_PPP)/chap-secrets
	sudo mv $(SYS_PPP)/pap-secrets.routing.bk $(SYS_PPP)/pap-secrets 
uninstall: unset_iface unset_ppp stop
test_uninstall:
	echo "Test interface files"
	python3 validator.py -f $(SYS_NET)/interfaces.d
	python3 validator.py -f $(SYS_NET)/interfaces
	python3 validator.py -f $(SYS_NET)/interfaces.d.routing.bk -e
	python3 validator.py -f $(SYS_NET)/interfaces.routing.bk -e

	echo "Test pppoe files"
	python3 validator.py -f $(SYS_PPP)/peers
	python3 validator.py -f $(SYS_PPP)/chap-secrets
	python3 validator.py -f $(SYS_PPP)/pap-secrets
	python3 validator.py -f $(SYS_PPP)/peers.routing.bk -e
	python3 validator.py -f $(SYS_PPP)/chap-secrets.routing.bk -e
	python3 validator.py -f $(SYS_PPP)/pap-secrets.routing.bk -e

	echo "Show plog"
	plog || true

	echo "Show ifconfig"
	ifconfig ppp0 || true
	ifconfig ppp1 || true

.PHONY: showconf
showconf:
	cat $(SYS_PPP)/peers/* 
	cat $(SYS_PPP)/chap-secrets
	cat $(SYS_PPP)/pap-secrets
	cat $(SYS_NET)/interfaces.d/lan
	cat $(SYS_NET)/interfaces.d/wan
