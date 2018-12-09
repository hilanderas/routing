#!make

.PHONY: test_init test_prepared test_conf_generated test_conf_ready test_conf_queued test_running

test_init:
	make test_revertconf || true
	make test_updateconf || true
	make test_rmconf || true
	make test_start || true
	make test_stop || true
	make test_restart || true
test_confgened: 
	make test_genconf || true
	make test_stop || true
	make test_restart || true
	make test_revertconf || true
	make test_updateconf || true
test_confqueued_pop_branch: 
	make test_genconf || true
	make test_start || true
	make test_updateconf || true
	make test_genconf || true
	make test_start || true
	make test_restart || true
	make test_rmconf || true
	make test_stop || true
	make test_start || true
	make test_stop || true
	make test_rmconf || true
test_confqueued_rm_branch: 
	make test_genconf || true
	make test_start || true
	make test_updateconf || true
	make test_genconf || true
	make test_start || true
	make test_restart || true
	make test_rmconf || true
	make test_revertconf || true
	make test_stop || true
	make test_rmconf || true
test_running: 
	make test_genconf || true
	make test_start || true
	make test_rmconf || true
	make test_start || true
	make test_genconf || true
	make test_revertconf || true
	make test_stop || true
	make test_rmconf || true
.PHONY: 
test_init_norm: 
	make test_genconf || true
	make test_rmconf || true
test_confgened_norm:
	make test_genconf || true
	make test_genconf || true
	make test_start || true
	make test_stop || true
	make test_rmconf || true
test_running_norm: 
	make test_genconf || true
	make test_start || true
	make test_restart || true
	make test_stop || true
	make test_start || true
	make test_updateconf || true
	make test_revertconf || true
	make test_stop || true
	make test_rmconf || true
test_confqueued_norm: 
	make test_genconf || true
	make test_start || true
	make test_updateconf || true
	make test_updateconf || true
	make test_stop || true
	make test_start || true
	make test_updateconf || true
	make test_revertconf || true
	make test_stop || true
	make test_rmconf || true

