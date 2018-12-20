# Install
{% video %}https://vimeo.com/306730332{% endvideo %}

### Login the machine you want to configure as a router
``` 
ssh [USER]@[IP/HOSTNAME]
```

### Download package and unzip
Choose one package to download according to your topology

e.g, WAN is dhcp mode for ubuntu 16.04
``` 
wget https://github.com/hilanderas/routing/releases/download/0.0.22/routing-16.04-dhcp-single-0.0.22.zip
unzip routing-16.04-dhcp-single-0.0.22.zip
```

> Check all available packages in [release page](https://github.com/elespejo/routing/releases).

### Install routing
``` 
cd dev-16.04-dhcp-single
make install
```


### Check states
``` 
make test_state
```

The state should be in running after installation.
