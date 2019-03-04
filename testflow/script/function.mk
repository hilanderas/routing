#!make
include .env

.PHONY: install uninstall installafteruninstall reinstall reuninstall checkconf 
ifeq ($(TESTMODE),dev)
install uninstall: 
	make  test_install
	make  test_uninstall
installafteruninstall: 
	make  test_install
	make  test_uninstall
	make  test_install
	make  test_uninstall
reinstall: 
	make  test_install
	make  test_install
	make  test_uninstall
reuninstall: 
	make  test_install
	make  test_uninstall
	make  test_uninstall
else ifeq ($(TESTMODE),prod)
install: 
	make  test_install
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make  test_uninstall
uninstall:  
	make  test_install
	make  test_uninstall
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
installafteruninstall: 
	make  test_install
	make  test_uninstall
	make  test_install
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make  test_uninstall
reinstall:  
	make  test_install
	make  test_install
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make  test_uninstall
reuninstall: 
	make  test_install
	make  test_uninstall
	make  test_uninstall
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
else
install uninstall installafteruninstall reinstall reuninstall: 
	make -s -f basic.mk hint CONTENT="Please set test mode to either dev or prod!"
endif

.PHONY: checkconf
checkconf:
	make test_install
	make test_showconf
	make test_uninstall

.PHONY: reboot_p1 poweroff_p1 
ifeq ($(TESTMODE), $(filter $(TESTMODE),dev prod))
reboot_p1: 
	make  test_install
	make  -f basic.mk re_boot
poweroff_p1:
	make test_install
	make -s -f basic.mk hint CONTENT="Please power off the machine!"
else
reboot_p1 poweroff_p1: 
	make -s -f basic.mk hint CONTENT="Please set test mode to either dev or prod!"
endif



.PHONY: reboot_p2 poweroff_p2 restartall 
ifeq ($(TESTMODE),dev)
reboot_p2 poweroff_p2: 
	make test_test_state
	make test_uninstall
restartall:
	make test_install
	make test_restart
	make test_test_state
	make test_uninstall
else ifeq ($(TESTMODE),prod)
reboot_p2 poweroff_p2: 
	make test_test_state
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make test_uninstall
restartall:
	make test_install
	make test_restart
	make test_test_state
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make test_uninstall
isprestart:
	make test_install
	make -f basic.mk hint CONTENT="Please restart isp!"
	sleep 120	
	make test_test_state
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make test_uninstall


else
reboot_p2 restartall poweroff_p2 isprestart: 
	make -s -f basic.mk hint CONTENT="Please set test mode to either dev or prod!"
endif

	
.PHONY: updateconf
ifeq ($(TESTMODE),dev)
updateconf: 
	make test_install
	make test_update
	make test_uninstall
else ifeq ($(TESTMODE),prod)
updateconf: 
	make test_install
	make test_update
	make test_showconf
	make -f basic.mk hint CONTENT="Please ping lan, wan, 114.114.114.114 of router in your pc!"
	make test_uninstall
else
updateconf:
	make -s -f basic.mk hint CONTENT="Please set test mode to either dev or prod!"
endif




