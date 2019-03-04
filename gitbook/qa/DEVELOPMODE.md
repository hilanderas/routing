# Develop mode

### Generate a project
* Generate packages for ubuntu 18.04, no load balance, dhcp for WAN
```bash
cd routing/testflow/script
make -s -f routing.mk create-proj-18-s-dhcp
```

* Generate packages for ubuntu 16.04, no load balance, dhcp for WAN
```bash
make -s -f routing.mk create-proj-16-s-dhcp
```

* Generate packages for ubuntu 16.04, no load balance, pppoe for WAN
```bash
make -s -f routing.mk create-proj-16-s-pppoe
```

* Generate packages for ubuntu 16.04, with load balance, pppoe for WAN
```bash
make -s -f routing.mk create-proj-16-d-pppoe
```

### Run test flow
* Abnormal state test
```bash
make -s -f state.mk test_init
make -s -f state.mk test_confgened
make -s -f state.mk test_running
make -s -f state.mk test_confqueued_pop_branch
make -s -f state.mk test_confqueued_rm_branch
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
make -s -f function.mk reboot_p1
make -s -f function.mk reboot_p2
make -s -f function.mk poweroff_p1
make -s -f function.mk poweroff_p2
make -s -f function.mk restartall
```
* Run update test cases
```bash
make -s -f function.mk updateconf
```

