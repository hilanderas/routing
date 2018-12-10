# Uninstall
* Delete all configurations generated by project
* Stop and disable routing services
* Delete rules added in iptables

### Uninstall packages
```bash
make uninstall
``` 

### Check state
After uninstallation, state should be in `init`
```bash
make test_state
```