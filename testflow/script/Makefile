#!make
include .env 

.PHONY: test_install test_uninstall test_update
test_install:
	make -s -f basic.mk hint CONTENT="test install"
	make -C ${TEST_PROJ} install  || true
	make -s -f basic.mk re_boot

test_uninstall:
	make -s -f basic.mk hint CONTENT="test uninstall"
	make -C ${TEST_PROJ} uninstall || true
	make -s -f basic.mk re_boot

test_update:
	make -s -f basic.mk hint CONTENT="test update"
	make -C ${TEST_PROJ} update || true
	make -s -f basic.mk re_boot

.PHONY: test_genconf test_rmconf test_revertconf test_updateconf
test_genconf:
	make -s -f basic.mk hint CONTENT="test genconf"
	make -C ${TEST_PROJ} config || true
	make test_test_state


test_rmconf:	
	make -s -f basic.mk hint CONTENT="test rmconfig"
	make -C ${TEST_PROJ} restore || true
	make test_test_state
	
test_revertconf:
	make -s -f basic.mk hint CONTENT="test revertconf"
	make -C ${TEST_PROJ} revert_config || true
	make test_test_state

test_updateconf:
	make -s -f basic.mk hint CONTENT="test updateconf"
	make -C ${TEST_PROJ} update_config || true
	make test_test_state

	
.PHONY: test_start test_stop test_restart 
test_start: 
	make -s -f basic.mk hint CONTENT="test start"	
	make -C ${TEST_PROJ} start || true
	make test_test_state

test_stop:
	make -s -f basic.mk hint CONTENT="test stop"
	make -C ${TEST_PROJ} stop || true
	make test_test_state

test_restart:	
	make -s -f basic.mk hint CONTENT="test restart"
	make -C ${TEST_PROJ} restart	|| true
	make test_test_state


.PHONY:  test_test_state
test_test_state:
	make -s -f basic.mk hint CONTENT="test test state"
	make -C ${TEST_PROJ} test_state || true
	make -s -f basic.mk confirm

.PHONY: test_showconf test_show_queued_conf
test_showconf:
	make -s -f basic.mk hint CONTENT="test showconf"
	make -C ${TEST_PROJ} showconf 
	make -s -f basic.mk confirm 

test_show_queued_conf:
	make -s -f basic.mk hint CONTENT="test show_queued_conf"
	make -C ${TEST_PROJ} show_queued_conf 
	make -s -f basic.mk confirm 
