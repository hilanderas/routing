# Develop mod

### Generate a project
```bash
make -s -f routing.mk create-proj-18-s-dhcp
make -s -f routing.mk create-proj-16-s-dhcp
```

### Run test flow
* Abnormal state test
```bash
make -s -f state.mk test_init
make -s -f state.mk test_confgened
make -s -f state.mk test_running
make -s -f state.mk test_confqueued
```

* Normal state test
```bash
make -s -f state.mk test_init_norm
make -s -f state.mk test_confgened_norm
make -s -f state.mk test_running_norm
make -s -f state.mk test_confqueued_norm
```

* Functionality test
```bash
make -s -f function.mk test_install
make -s -f function.mk test_uninstall
make -s -f function.mk test_installafteruninstall
make -s -f function.mk test_reinstall
make -s -f function.mk test_reuninstall
make -s -f function.mk test_checkconf
```

* Run restart test case
```bash
make -s -f restart.mk test_reboot_p1
make -s -f restart.mk test_reboot_p2
make -s -f restart.mk test_poweroff_p1
make -s -f restart.mk test_poweroff_p2
make -s -f restart.mk test_isprestart
make -s -f restart.mk test_restartall
```
* Run update test cases
```bash
make -s -f update.mk
```


