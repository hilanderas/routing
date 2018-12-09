# Develop mod

### Generate a project
```bash
make -f routing.mk create-proj-18-s-dhcp
make -f routing.mk create-proj-16-s-dhcp
```

### Run test flow
* Abnormal state test
```bash
make -f state.mk test_init
make -f state.mk test_confgened
make -f state.mk test_running
make -f state.mk test_confqueued
```

* Normal state test
```bash
make -f state.mk test_init_norm
make -f state.mk test_confgened_norm
make -f state.mk test_running_norm
make -f state.mk test_confqueued_norm
```

* Functionality test
```bash
make -f function.mk test_install
make -f function.mk test_uninstall
make -f function.mk test_installafteruninstall
make -f function.mk test_reinstall
make -f function.mk test_reuninstall
make -f function.mk test_checkconf
```

* Run restart test case
```bash
make -f restart.mk test_reboot_p1
make -f restart.mk test_reboot_p2
make -f restart.mk test_poweroff_p1
make -f restart.mk test_poweroff_p2
make -f restart.mk test_isprestart
make -f restart.mk test_restartall
```
* Run update test cases
```bash
make -f update.mk
```


