# Production mode

### Download routing-testflow packages
```bash
wget https://github.com/hilanderas/routing/releases/download/0.0.11/routing-testflow-0.0.11.zip
unzip routing-testflow-0.0.11.zip
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

### Run test flow
* Functionality test
```bash
make -s -f function.mk install
make -s -f function.mk uninstall
make -s -f function.mk installafteruninstall
make -s -f function.mk reinstall
make -s -f function.mk reuninstall
make -s -f function.mk checkconf
```

* Run restart test case
```bash
make -s -f restart.mk reboot_p1
make -s -f restart.mk reboot_p2
make -s -f restart.mk poweroff_p1
make -s -f restart.mk poweroff_p2
make -s -f restart.mk isprestart
make -s -f restart.mk restartall
```
* Run update test cases
```bash
make -s -f update.mk
```


