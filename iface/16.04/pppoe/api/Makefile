SYS_NET = /etc/network
SYS_PPP = /etc/ppp

.PHONY: set_iface
set_iface:
	echo "set-wan"
	echo "set-lan"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	sudo cp $(CONFIG)/interfaces $(SYS_NET)/
	sudo cp -r $(CONFIG)/interfaces.d $(SYS_NET)/

.PHONY: set_ppp
set_ppp:
	echo "set-ppp"
	sudo mv $(SYS_PPP)/chap-secrets $(SYS_PPP)/chap-secrets.ppp.bk
	sudo mv $(SYS_PPP)/pap-secrets $(SYS_PPP)/pap-secrets.ppp.bk
	sudo cp $(CONFIG)/secrets/* $(SYS_PPP)/
	sudo mv $(SYS_PPP)/peers $(SYS_PPP)/peers.bk
	sudo cp -r $(CONFIG)/peers $(SYS_PPP)/

.PHONY: start
start:
	echo "You need to reboot to make it work"

.PHONY: install
install: set_iface set_ppp start

.PHONY: stop
stop:
	echo "You need to reboot to make it work"

.PHONY: unset_iface
unset_iface:
	sudo mv $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d

.PHONY: unset_ppp
unset_ppp:
	sudo rm -r $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/peers.bk $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/chap-secrets.ppp.bk $(SYS_PPP)/chap-secrets
	sudo mv $(SYS_PPP)/pap-secrets.ppp.bk $(SYS_PPP)/pap-secrets 

.PHONY: uninstall
uninstall: unset_iface unset_ppp stop

.PHONY: status_iface status_ppp
status_iface:
	./existed.sh $(SYS_NET)/interfaces.d
	./existed.sh $(SYS_NET)/interfaces
	./existed.sh $(SYS_NET)/interfaces.d.bk
	./existed.sh $(SYS_NET)/interfaces.bk

status_ppp:
	./existed.sh $(SYS_PPP)/peers
	./existed.sh $(SYS_PPP)/chap-secrets
	./existed.sh $(SYS_PPP)/pap-secrets
	./existed.sh $(SYS_PPP)/chap-secrets.ppp.bk
	./existed.sh $(SYS_PPP)/pap-secrets.ppp.bk

.PHONY: status
status: status_iface status_ppp
	ifconfig
	plog || true

.PHONY: showconf
showconf:
	sudo cat $(SYS_PPP)/peers/* 
	sudo cat $(SYS_PPP)/chap-secrets
	sudo cat $(SYS_PPP)/pap-secrets
