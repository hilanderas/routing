# How to check state

There are 4 states in system, check states by:
```bash
make test_state
```
### INIT  
* Config exists- False
* Config_queue exists - False
* Config put in right place - False
* Service running - False

### CONFGENED  
* Config exists- False
* Config_queue exists - True
* Config put in right place - False
* Service running - False

### RUNNING  
* Config exists- True
* Config_queue exists - False
* Config put in right place - True
* Service running - True

### CONFQUEUED  
* Config exists- True
* Config_queue exists - True
* Config put in right place - True
* Service running - True

