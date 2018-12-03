SYS_NET = /etc/network
SYS_PPP = /etc/ppp

.PHONY: set_iface test-set_iface
set_iface:
	echo "set-wan"
	echo "set-lan"
	sudo mv $(SYS_NET)/interfaces $(SYS_NET)/interfaces.bk
	sudo mv $(SYS_NET)/interfaces.d $(SYS_NET)/interfaces.d.bk
	sudo cp $(CONFIG)/interfaces $(SYS_NET)/
	sudo cp -r $(CONFIG)/interfaces.d $(SYS_NET)/
test-set_iface:
	ls $(SYS_NET)/inter*
	diff -r $(SYS_NET)/interfaces.d $(CONFIG)/interfaces.d
	diff $(SYS_NET)/interfaces $(CONFIG)/interfaces
	test -d $(SYS_NET)/interfaces.d.bk && echo "$(SYS_NET)/interfaces.d.bk exists." || echo "$(SYS_NET)/interfaces.d.bk does not exists."
	test -e $(SYS_NET)/interfaces.bk && echo "$(SYS_NET)/interfaces.bk exists." || echo "$(SYS_NET)/interfaces.bk does not exists."

.PHONY: set_ppp test-set_ppp
set_ppp:
	echo "set-ppp"
	sudo mv $(SYS_PPP)/chap-secrets $(SYS_PPP)/chap-secrets.ppp.bk
	sudo mv $(SYS_PPP)/pap-secrets $(SYS_PPP)/pap-secrets.ppp.bk
	sudo cp $(CONFIG)/secrets/* $(SYS_PPP)/
	sudo mv $(SYS_PPP)/peers $(SYS_PPP)/peers.bk
	sudo cp -r $(CONFIG)/peers $(SYS_PPP)/
test-set_ppp:
	diff -r $(SYS_PPP)/peers $(CONFIG)/peers || true
	diff $(SYS_PPP)/chap-secrets $(CONFIG)/secrets/chap-secrets || true
	diff $(SYS_PPP)/pap-secrets $(CONFIG)/secrets/pap-secrets || true
	test -e $(SYS_PPP)/chap-secrets.ppp.bk && echo "chap-secrets.ppp.bk exists." || echo "chap-secrets.ppp.bk does not exists."
	test -e $(SYS_PPP)/pap-secrets.ppp.bk && echo "pap-secrets.ppp.bk exists." || echo "pap-secrets.ppp.bk does not exists."

.PHONY: start test-start
start:
	echo "You need to reboot to make it work"
test-start:
	ifconfig br0
	ifconfig ppp1
	plog || true

.PHONY: install test-install
install: set_iface set_ppp start
test-install: test-set_iface test-set_ppp test-start


.PHONY: stop test-stop
stop:
	echo "You need to reboot to make it work"
test-stop:
	echo "test stop iface"

.PHONY: unset_iface test-unset_iface
unset_iface:
	sudo mv $(SYS_NET)/interfaces.bk $(SYS_NET)/interfaces
	sudo rm -rf $(SYS_NET)/interfaces.d
	sudo mv $(SYS_NET)/interfaces.d.bk $(SYS_NET)/interfaces.d
test-unset_iface:
	ls $(SYS_NET)/inter*
	test -d $(SYS_NET)/interfaces.d && echo "$(SYS_NET)/interfaces.d exists." || echo "$(SYS_NET)/interfaces.d does not exists."
	test -e $(SYS_NET)/interfaces && echo "$(SYS_NET)/interfaces exists." || echo "$(SYS_NET)/interfaces does not exists."

.PHONY: unset_ppp test-unset_ppp
unset_ppp:
	sudo rm -r $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/peers.bk $(SYS_PPP)/peers
	sudo mv $(SYS_PPP)/chap-secrets.ppp.bk $(SYS_PPP)/chap-secrets
	sudo mv $(SYS_PPP)/pap-secrets.ppp.bk $(SYS_PPP)/pap-secrets 
test-unset_ppp:
	test -e $(SYS_PPP)/chap-secrets && echo "chap-secrets exists." || echo "chap-secrets does not exists."
	test -e $(SYS_PPP)/pap-secrets && echo "pap-secrets exists." || echo "pap-secrets does not exists."

.PHONY: uninstall test-uninstall
uninstall: unset_iface unset_ppp stop
test-uninstall: test-stop test-unset_iface test-unset_ppp
