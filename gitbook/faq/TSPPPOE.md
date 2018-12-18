# Trouble shooting for PPPoE

### 1. Why PPPoE dial up failed 
* Check username and password to make sure they are correct
```bash
make showconf
```
* Check logs to see what is happening
```bash
make test_state
```

### 2. Why load balance failed to start
* It takes 2 minutes for load balance service to start after the machine restarts, so please wait for 2 minutes to check again 
* If ISP restarts, load balance will not start automatically, you need to restart routing manually with:
```bash
make restart
```