# Develop mod

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
make -s -f state.mk test_confqueued
```

* Normal state test
```bash
make -s -f state.mk test_init_norm
make -s -f state.mk test_confgened_norm
make -s -f state.mk test_running_norm
make -s -f state.mk test_confqueued_norm
```
