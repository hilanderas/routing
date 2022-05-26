# Develop mode

### Generate a project
* Generate packages for ubuntu 18.04, no load balance, dhcp for WAN
```  
cd routing/testflow/script
make -f routing.mk create-proj-18-s-dhcp
```

* Generate packages for ubuntu 18.04, no load balance, PPPoE for WAN
```  
make -f routing.mk create-proj-18-s-pppoe
```

* Generate packages for ubuntu 18.04, with load balance, PPPoE for WAN
```  
make -f routing.mk create-proj-18-d-pppoe
```

### Run test flow
* Abnormal state test
```  
make -s -f state.mk test_init
make -s -f state.mk test_confgened
make -s -f state.mk test_running
make -s -f state.mk test_confqueued
```

* Normal state test
```  
make -s -f state.mk test_init_norm
make -s -f state.mk test_confgened_norm
make -s -f state.mk test_running_norm
make -s -f state.mk test_confqueued_norm
```


### Clean up
```  
make -s -f routing.mk del-proj-18-s-dhcp
make -s -f routing.mk del-proj-18-s-pppoe
make -s -f routing.mk del-proj-18-d-pppoe
```
