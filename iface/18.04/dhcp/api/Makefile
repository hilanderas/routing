SYS_NET = /etc/netplan

.PHONY: install set start
set:
	echo "set-wan"
	echo "set-lan"
	sudo mkdir $(SYS_NET).bk
	sudo mv $(SYS_NET)/* $(SYS_NET).bk/ || true
	sudo cp -r $(CONFIG)/01-lan.yaml $(SYS_NET)/
	sudo cp -r $(CONFIG)/02-wan.yaml $(SYS_NET)/

start:
	sudo netplan apply
	echo "FINISH"

install: set start



.PHONY: uninstall stop unset
stop:
	sudo netplan apply
unset:
	echo "unset-wan"
	echo "unset-lan"
	sudo rm $(SYS_NET)/* || true
	sudo cp $(SYS_NET).bk/* $(SYS_NET)/ || true
	sudo rm -rf $(SYS_NET).bk

uninstall: unset stop

.PHONY: status
status:
	./existed.sh $(SYS_NET)
	./existed.sh $(SYS_NET)/01-lan.yaml
	./existed.sh $(SYS_NET)/02-wan.yaml
	ls $(SYS_NET)/ || true
	./existed.sh $(SYS_NET).bk
	ls $(SYS_NET).bk/ || true
	ifconfig

.PHONY: showconf
showconf: $(SYS_NET)/01-lan.yaml $(SYS_NET)/02-wan.yaml
	./existed.sh $(SYS_NET)/01-lan.yaml
	./existed.sh $(SYS_NET)/02-wan.yaml

