version=0.1.0
project=routing
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
DEV=$(CURDIR)/dev

.PHONY: create-dev clean-dev
create-dev:
	mkdir $(CURDIR)/dev/iface $(CURDIR)/dev/route
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile set 
	cp -r $(CURDIR)/iface/ctl/* $(DEV)/iface
	cp -r $(CURDIR)/route/* $(DEV)/route
	make -C $(CURDIR)/iface -f $(CURDIR)/iface/Makefile clean 
clean-dev:
	rm -rf $(CURDIR)/dev/iface $(CURDIR)/dev/route
		
.PHONY: build_book
build-book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)

.PHONY: build
build: create-dev
	cp -r dev $(project)
	cd $(project)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(project)-$(version).md5; cd -
	mv $(project)-$(version).md5 $(project)
	zip -r $(project)-$(OS_VERSION)-$(WAN_MODE)-$(version).zip $(project)
	rm -rf $(project)
clean: clean-dev
	rm -rf *.zip
