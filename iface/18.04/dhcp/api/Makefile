SYS_NET = /etc/netplan

.PHONY: install set start
set:
	echo "set-wan"
	echo "set-lan"
	mkdir $(SYS_NET).bk
	mv $(SYS_NET)/* $(SYS_NET).bk/ || true
	cp -r $(CONFIG)/01-lan.yaml $(SYS_NET)/
	cp -r $(CONFIG)/02-wan.yaml $(SYS_NET)/

start:
	netplan apply

install: set start



.PHONY: uninstall stop unset
stop:
	netplan apply
unset:
	echo "unset-wan"
	echo "unset-lan"
	rm $(SYS_NET)/* || true
	cp $(SYS_NET).bk/* $(SYS_NET)/ || true
	rm -rf $(SYS_NET).bk

uninstall: unset stop

.PHONY: status
status:
	./existed.sh $(SYS_NET)
	./existed.sh $(SYS_NET)/01-lan.yaml
	./existed.sh $(SYS_NET)/02-wan.yaml
	ls $(SYS_NET)/
	./existed.sh $(SYS_NET).bk
	ls $(SYS_NET).bk/
#	ifconfig

.PHONY: showconf
showconf: $(SYS_NET)/01-lan.yaml $(SYS_NET)/02-wan.yaml
	./existed.sh $(SYS_NET)/01-lan.yaml
	./existed.sh $(SYS_NET)/02-wan.yaml

