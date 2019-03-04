# Trouble shooting for PPPoE

**Please fire an [issue](https://github.com/hilanderas/routing/issues) if you don't find answers here or check the [change log](https://github.com/hilanderas/routing/releases)**


### 1. Why PPPoE dial up failed 
* Check username and password to make sure they are correct
```make
make showconf
```
* Check logs to see what is happening
```make 
make test_state
```

### 2. Why load balance failed to start
* If the machine restarts, it takes 2 minutes for load balance service to start, so please wait for 2 minutes to check again 
* If ISP restarts, load balance will not start automatically, you need to restart routing manually with:
```make
make restart
```

