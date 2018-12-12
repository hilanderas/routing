#!make

.PHONY: test_init  test_confgened test_confqueued  test_running

test_init:
	make test_revertconf 
	make test_updateconf 
	make test_rmconf 
	make test_start 
	make test_stop 
	make test_restart 
test_confgened: 
	make test_genconf  
	make test_stop  
	make test_restart  
	make test_revertconf  
	make test_updateconf  
	make test_rmconf  
test_confqueued: 
	make test_genconf  
	make test_start  
	make test_updateconf  
	make test_genconf  
	make test_start  
	make test_rmconf  
	make test_stop  
	make test_rmconf  
test_running: 
	make test_genconf  
	make test_start  
	make test_rmconf  
	make test_start  
	make test_genconf  
	make test_revertconf  
	make test_stop  
	make test_rmconf  
.PHONY: test_init_norm test_confgened_norm test_running_norm test_confqueued_norm
test_init_norm: 
	make test_genconf  
	make test_rmconf  
test_confgened_norm:
	make test_genconf  
	make test_genconf  
	make test_start  
	make test_stop  
	make test_rmconf  
test_running_norm: 
	make test_genconf  
	make test_start  
	make test_restart  
	make test_stop  
	make test_start  
	make test_updateconf  
	make test_revertconf  
	make test_stop  
	make test_rmconf  
test_confqueued_norm: 
	make test_genconf  
	make test_start  
	make test_updateconf  
	make test_stop  
	make test_start  
	make test_updateconf  
	make test_restart  
	make test_updateconf  
	make test_revertconf  
	make test_stop  
	make test_rmconf 

