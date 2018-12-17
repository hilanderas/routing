SYS_NET = /etc/netplan

.PHONY: install set start test_install
set:
	echo "set-wan"
	echo "set-lan"
	sudo mkdir $(SYS_NET).routing.bk
	sudo mv $(SYS_NET)/* $(SYS_NET).routing.bk/ || true
	sudo cp -r $(CONFIG)/01-lan.yaml $(SYS_NET)/
	sudo cp -r $(CONFIG)/02-wan.yaml $(SYS_NET)/
start:
	sudo netplan apply
	echo "FINISH"
install: set start
test_install:
	python3 validator.py -f $(SYS_NET)
	python3 validator.py -f $(SYS_NET)/01-lan.yaml
	python3 validator.py -f $(SYS_NET)/02-wan.yaml
	python3 validator.py -f $(SYS_NET).routing.bk

.PHONY: uninstall stop unset test_uninstall
stop:
	sudo netplan apply
unset:
	echo "unset-wan"
	echo "unset-lan"
	sudo rm $(SYS_NET)/* || true
	sudo cp $(SYS_NET).routing.bk/* $(SYS_NET)/ || true
	sudo rm -rf $(SYS_NET).routing.bk
uninstall: unset stop
test_uninstall:
	python3 validator.py -f $(SYS_NET).routing.bk -e
	python3 validator.py -f $(SYS_NET)
	python3 validator.py -f $(SYS_NET)/01-lan.yaml -e
	python3 validator.py -f $(SYS_NET)/02-wan.yaml -e

.PHONY: showconf
showconf: $(SYS_NET)/01-lan.yaml $(SYS_NET)/02-wan.yaml
	cat $(SYS_NET)/01-lan.yaml
	cat $(SYS_NET)/02-wan.yaml

