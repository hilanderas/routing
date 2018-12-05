version=0.1.0
project=routing
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
DEV=$(CURDIR)/dev

.PHONY: create-dev clean-dev
create-dev:
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile set 
	mkdir $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM) $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/iface $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/route
	cp $(DEV)/Makefile $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/
	cp -r $(CURDIR)/iface/ctl/* $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/iface
	cp -r $(CURDIR)/route/$(ROUTE_NUM)/* $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/route
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile clean 
clean-dev:
	rm -rf $(DEV)-*

.PHONY: build_book
build-book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)

.PHONY: build
build: create-dev
	cd $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(project)-$(version).md5; cd -
	mv $(project)-$(version).md5 $(DEV)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)
	zip -r $(project)-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)-$(version).zip dev-$(OS_VERSION)-$(WAN_MODE)-$(ROUTE_NUM)
clean:
	rm -rf *.zip
