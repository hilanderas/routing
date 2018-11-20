version=0.1.0
project=routing
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
DEV=$(CURDIR)/dev

.PHONY: create-dev clean-dev
create-dev:
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile set 
	mkdir $(DEV)-$(OS_VERSION)-$(WAN_MODE) $(DEV)-$(OS_VERSION)-$(WAN_MODE)/iface $(DEV)-$(OS_VERSION)-$(WAN_MODE)/route
	cp $(DEV)/Makefile $(DEV)-$(OS_VERSION)-$(WAN_MODE)/
	cp -r $(CURDIR)/iface/ctl/* $(DEV)-$(OS_VERSION)-$(WAN_MODE)/iface
	cp -r $(CURDIR)/route/* $(DEV)-$(OS_VERSION)-$(WAN_MODE)/route
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile clean 
clean-dev:
	rm -rf $(DEV)-*
		
.PHONY: build_book
build-book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)

.PHONY: build
build: create-dev
	cp -r $(DEV)-$(OS_VERSION)-$(WAN_MODE) $(CURDIR)/$(project)
	cd $(project)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(project)-$(version).md5; cd -
	mv $(project)-$(version).md5 $(project)
	zip -r $(project)-$(OS_VERSION)-$(WAN_MODE)-$(version).zip $(project)
	rm -rf $(project)
clean:
	rm -rf *.zip
