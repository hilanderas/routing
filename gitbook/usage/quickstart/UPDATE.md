# Update

* Update WAN or LAN
* Update static ip of LAN

### Update configuration
During update, three [configuration](../morescenarios/CONFIG.md) files will pop up be for you to modify, enter `:wq` after modification
```bash
make update
```

### Check whether configuration updated and working
* Check configuration
```bash
make showconf
```

* Check status
```bash
make test_state
```