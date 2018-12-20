# How to check config

There are 2 kinds of config in system:
* config - For the running service
* config_queued - For generating config

### Show running config
```bash
make showconfig
```

### Show queued config
```bash
make show_queued_config
```


### Delete config
When you are in CONFGENED state, you can discard config_queued by:
```bash
make restore 
```
After the action, you will be in init state

### Revert config
When you in CONFQUEUED state, you can discard config_queued by:
```bash
make revert_config
```
After the action, you will be in running state
