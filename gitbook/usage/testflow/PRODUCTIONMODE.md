# Production mode

### Download routing-testflow packages
```bash
wget https://github.com/hilanderas/routing/releases/download/0.0.12/routing-testflow-0.0.12.zip
unzip routing-testflow-0.0.12.zip
```
### Check integrity of routing-testflow packages
```bash
cd routing-testflow
make -f basic.mk test_integrity
```

### Download routing project you are going to test with
```bash
cd routing-testflow
make -f basic.mk download
```

### Set test project
```bash
make -f basic.mk config TEST_PROJ=dev-16.04-dhcp-single 
```
Or 
```bash
make -f basic.mk config TEST_PROJ=dev-18.04-dhcp-single
```
Or 
```bash
make -f basic.mk config TEST_PROJ=dev-16.04-pppoe-single
```
Or
```bash
make -f basic.mk config TEST_PROJ=dev-16.04-pppoe-dual
```

### Run test flow
* Install and uninstall test
```bash
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```

* Install after uninstall
```bash
make test_install
make test_test_state
make test_uninstall
make test_test_state
make test_install
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```

* Reinstall
```bash
make test_install
make test_test_state
make test_install
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```

* Reuninstall
```bash
make test_install
make test_test_state
make test_uninstall
make test_test_state
make test_uninstall
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
```

* Checkconf
```bash
make test_install
make test_test_state
make test_showconf
make test_uninstall
make test_test_state
```

* Reboot
```bash
make test_install
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make -f basic.mk re_boot
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```
* Power off
```bash
make test_install
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
# Please power off router
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```

* ISP restart
```bash
make test_install
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
# Please restart isp
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```


* Restart 
```bash
make test_install
make test_test_state
make test_restart
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_uninstall
make test_test_state
```


* Run update test cases
```bash
make test_install
make test_test_state
make test_update
make test_test_state
# On pc connected to router, ping lan ip, wan ip of router and 114.114.114.114
make test_showconf
make test_uninstall
make test_test_state
```


