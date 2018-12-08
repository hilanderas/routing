
.PHONY: set test clean
set: clean
	cp -r $(CURDIR)/$(OS_VERSION)/$(WAN_MODE)/* $(CURDIR)/ctl/
test:
	tree ctl
clean:
	rm -rf ctl/api ctl/confgen || true
	rm -rf ctl/config || true
