# Install

### Login the machine you want to configured as a router
```bash
ssh [USER]@[IP/HOSTNAME]
```
* [USER]: The user name of router.
* [IP/HOSTNAME]: The ip of router or the hostname of router.

### Download package and unzip
Download the routing package:
```bash
wget https://github.com/hilanderas/routing/releases/download/0.0.17/routing-16.04-dhcp-single-0.0.17.zip
unzip routing-16.04-dhcp-single-0.0.17.zip
```

> Check all available packages in [release page](https://github.com/elespejo/routing/releases).

### Install routing
```bash
make install
```


### Check states
```bash
make test_state
```

The state should be in running after installation.
