# Trouble shooting for dhcp
**Please fire an [issue](https://github.com/hilanderas/routing/issues) if you don't find answers here or check the [change log](https://github.com/hilanderas/routing/releases)**

### 1. Why I can't ping WAN after installing routing
It is probably because of an incorrect WAN configuration. Please follow the steps to check 

* Execute `make test_state` to test current state, it should be RUNNING and all test cases should be passed (you can see a green `True` in the front of each statement). 

* Then execute `make showconf` to check your configuration. Make sure LAN and WAN you filled are correct comparing with the result from `ip link`.

### 2. Why I can't ping public IP after install routing
It is probably because of an incorrect iptables rules added. Please follow the steps to check 

* Run `make test_state` to test current state, it should be RUNNING and all test cases should be passed (you can see a green `True` in the front of each statement). 

* Then check rules in iptables, make sure LAN and WAN are correct, e.g, if enp2s0 is WAN and br0 is LAN, then it should look like this:
```
-P POSTROUTING ACCEPT
-A POSTROUTING -o enp2s0 -j MASQUERADE 
-P FORWARD ACCEPT
-A FORWARD -i enp2s0 -o br0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -m conntrack --ctstate NEW -j ACCEPT
-A FORWARD -i enp2s0 -o br0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i br0 -o enp2s0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
``` 
