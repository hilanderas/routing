# Uninstall
* Stop and disable routing services
* Delete rules added in iptables
* Delete all configurations generated by project

### Uninstall packages
``` 
make uninstall
``` 

### Check state
After uninstallation, state should be in `init`
``` 
make test_state
```
