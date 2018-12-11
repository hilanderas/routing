# How to check state

There are 4 states in system, check states by:
```bash
make test_state
```
### INIT  
* Config exists - False
* Config_queue exists - False
* Config put in right place - False
* Service running - False

### CONFGENED  
* Config exists - False
* Config_queue exists - True
* Config put in right place - False
* Service running - False

### RUNNING
In this state, config and config_queue are exactly the same 
* Config exists - True
* Config_queue exists - True
* Config put in right place - True
* Service running - True

### CONFQUEUED  
In this state, config and config_queue are probably not the same
* Config exists - True
* Config_queue exists - True
* Config put in right place - True
* Service running - True


### Further explanation of the attributes
* Config put in right place - each file or directory in config were put in places that will work, e.g, /etc/network
* Service running - routing.service is enable and active, new rules in iptables exist