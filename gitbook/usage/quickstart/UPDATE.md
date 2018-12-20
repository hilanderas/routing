# Update

### When to update
* Update WAN or LAN
* Update static ip of LAN

### Update configuration
During update, three [configuration](../morescenarios/CONFIG.md) files will be popped up for editing, enter `:wq` after modification
```bash
make update
```

### Check whether configuration updated and working
* Check configuration
```bash
make showinfo
```

* Check state

	State should be in running
```bash
make test_state
```