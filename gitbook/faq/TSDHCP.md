# Trouble shooting for dhcp

### 1. Why I can't ping WAN after install routing
* Run test_state to check current state, all tests should be passed(you can see a green True in the front of each statement) and state is running
```bash
make test_state
```

* If all tests pass and the state is running, then check your configuration
```bash
make showconf
```
Make sure LAN and WAN you filled are existing in system, check them by
```bash
ip link
``` 

### 2. Why I can't ping public IP after install routing
* Run test_state to check current state, all tests should be passed(you can see a green True in the front of each statement) and state is running
```bash
make test_state
```

* If all tests pass and the state is running, then check your configuration in iptables 
```bash
make test_state
```
Make sure LAN and WAN in iptables are correct, e.g, enp2s0 is WAN and br0 is LAN, then iptables should look like this:
```
-P POSTROUTING ACCEPT
-A POSTROUTING -o enp2s0 -j MASQUERADE 
-A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE
-P FORWARD ACCEPT
-A FORWARD -j DOCKER-USER
-A FORWARD -j DOCKER-ISOLATION-STAGE-1
-A FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -o docker0 -j DOCKER
-A FORWARD -i docker0 ! -o docker0 -j ACCEPT
-A FORWARD -i docker0 -o docker0 -j ACCEPT
-A FORWARD -i enp2s0 -o br0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -m conntrack --ctstate NEW -j ACCEPT
-A FORWARD -i enp2s0 -o br0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i br0 -o enp2s0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
``` 
