# How to check config

There are 2 kinds of config in system:
* config - For the running service
* config_queque - For generating config

### Show running config
```bash
make showconf
```

### Show queued config
```bash
make show_queued_conf
```


### Delete config
When you in CONFGENED state, you can discard config_queue by:
```bash
make restore 
```

### Revert config
When you in CONFQUEUED state, you can discard config_queue by:
```bash
make revert_config
```