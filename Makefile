version=0.0.23
project=routing
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
DEV=$(CURDIR)/dev
TESTFLOW=$(project)-testflow
OS_VERSION=18.04
WAN_MODE=dhcp
ROUTE_NUM=single

.PHONY: create-dev clean-dev
create-dev:
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile set 
	mkdir $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM) $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/iface $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/route
	cp $(DEV)/Makefile $(DEV)/sm.mk $(DEV)/is.sh $(DEV)/.state.conf $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/
	cp -r $(CURDIR)/iface/ctl/* $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/iface
	cp -r $(CURDIR)/route/$(ROUTE_NUM)/* $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/route
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile clean 
clean-dev:
	rm -rf $(DEV)-*

.PHONY: build-book
build-book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)

.PHONY: build
build: create-dev
	cd $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(project)-$(version).md5; cd -
	mv $(project)-$(version).md5 $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)
	zip -r $(project)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)-$(version).zip dev-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)
clean:
	rm -rf *.zip


.PHONY: build-testflow
build-testflow:
	cp -r testflow/script $(TESTFLOW)
	cd $(TESTFLOW) && make -f basic.mk set_mod TESTMODE=prod
	sed -i '/PROJ_VERSION/c\export PROJ_VERSION=${version}' $(TESTFLOW)/.env
	cd $(TESTFLOW)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(TESTFLOW)-$(version).md5; cd -
	mv $(TESTFLOW)-$(version).md5 $(TESTFLOW)
	zip -r $(TESTFLOW)-$(version).zip $(TESTFLOW)
	rm -rf $(TESTFLOW)

.PHONY: update-gitbook
update-gitbook: $(GITBOOK)
	sed -Ei s/[0-9]+[.][0-9]+[.][0-9]+/$(version)/g $(CURDIR)/gitbook/qa/PRODUCTIONMODE.md
	sed -Ei s/[0-9]+[.][0-9]+[.][0-9]+/$(version)/g $(CURDIR)/gitbook/SUMMARY.md
	sed -Ei s/[0-9]+[.][0-9]+[.][0-9]+/$(version)/g $(CURDIR)/gitbook/quickstart/INSTALL.md
	grep -R --color=always $(version) $(CURDIR)/gitbook


