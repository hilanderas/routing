# Develop mod

### Generate a project
* Generate packages for ubuntu 18.04, no load balance, dhcp for WAN
```bash
cd routing/testflow/script
make -f routing.mk create-proj-18-s-dhcp
```

* Generate packages for ubuntu 16.04, no load balance, dhcp for WAN
```bash
make -f routing.mk create-proj-16-s-dhcp
```

* Generate packages for ubuntu 16.04, no load balance, pppoe for WAN
```bash
make -f routing.mk create-proj-16-s-pppoe
```

* Generate packages for ubuntu 16.04, with load balance, pppoe for WAN
```bash
make -f routing.mk create-proj-16-d-pppoe
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
