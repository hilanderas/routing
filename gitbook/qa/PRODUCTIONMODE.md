# Production mode

### Download routing-testflow packages
```  
wget https://github.com/hilanderas/routing/releases/download/0.0.22/routing-testflow-0.0.22.zip
unzip routing-testflow-0.0.22.zip
```
### Check integrity of routing-testflow packages
```  
cd routing-testflow
make -f basic.mk test_integrity
```

### Download routing project you are going to test with
```  
make -f basic.mk download
```

### Set test project
```  
make -f basic.mk config TEST_PROJ=dev-16.04-dhcp-single 
```
Or 
```  
make -f basic.mk config TEST_PROJ=dev-18.04-dhcp-single
```
Or 
```  
make -f basic.mk config TEST_PROJ=dev-16.04-pppoe-single
```
Or
```  
make -f basic.mk config TEST_PROJ=dev-16.04-pppoe-dual
```

### Run test flow
* Install and uninstall test
```  
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```

* Install after uninstall
```  
make test_install
make test_test_state
make test_uninstall
make test_test_state
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```

* Reinstall
```  
make test_install
make test_test_state
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```

* Reuninstall
```  
make test_install
make test_test_state
make test_uninstall
make test_test_state
make test_uninstall
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
```

* Checkconf
```  
make test_install
make test_test_state
make test_showconf
make test_uninstall
make test_test_state
```

* Reboot
```  
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make -f basic.mk re_boot
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```
* Power off
```  
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
# Please power off router
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```

* ISP restart
```  
make test_install
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
# Please restart isp
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```


* Restart 
```  
make test_install
make test_test_state
make test_restart
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_uninstall
make test_test_state
```


* Run update test cases
```  
make test_install
make test_test_state
make test_update
make test_test_state
# On pc connected to router, configure a static IP 
# And ping lan ip, wan ip of router and public IP
make test_showconf
make test_uninstall
make test_test_state
```


