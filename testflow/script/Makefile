#!make
include .env 

.PHONY: test_install test_uninstall test_update
test_install:
	make -f basic.mk hint CONTENT="test install"
	make -C ${TEST_PROJ} install  || true
	make test_test_state

test_uninstall:
	make -f basic.mk hint CONTENT="test uninstall"
	make -C ${TEST_PROJ} uninstall || true
	make test_test_state

test_update:
	make -f basic.mk hint CONTENT="test update"
	make -C ${TEST_PROJ} update || true
	make test_test_state

.PHONY: test_genconf test_rmconf test_revertconf test_updateconf
test_genconf:
	make -f basic.mk hint CONTENT="test genconf"
	make -C ${TEST_PROJ} config || true
	make test_test_state


test_rmconf:	
	make -f basic.mk hint CONTENT="test rmconfig"
	make -C ${TEST_PROJ} restore || true
	make test_test_state
	
test_revertconf:
	make -f basic.mk hint CONTENT="test revertconf"
	make -C ${TEST_PROJ} revert_config || true
	make test_test_state

test_updateconf:
	make -f basic.mk hint CONTENT="test updateconf"
	make -C ${TEST_PROJ} update_config || true
	make test_test_state

	
.PHONY: test_start test_stop test_restart 
test_start: 
	make -f basic.mk hint CONTENT="test start"	
	make -C ${TEST_PROJ} start || true
	make test_test_state

test_stop:
	make -f basic.mk hint CONTENT="test stop"
	make -C ${TEST_PROJ} stop || true
	make test_test_state

test_restart:	
	make -f basic.mk hint CONTENT="test restart"
	make -C ${TEST_PROJ} restart	|| true
	make test_test_state


.PHONY:  test_test_state
test_test_state:
	make -f basic.mk hint CONTENT="test test state"
	make -C ${TEST_PROJ} test_state || true
	make -f basic.mk confirm 

.PHONY: test_showconf test_show_queued_conf
test_showconf:
	make -f basic.mk hint CONTENT="test showconf"
	make -C ${TEST_PROJ} showconf 
	make -f basic.mk confirm 

test_show_queued_conf:
	make -f basic.mk hint CONTENT="test show_queued_conf"
	make -C ${TEST_PROJ} show_queued_conf 
	make -f basic.mk confirm 
