# Install
<iframe frameborder="0" width="100%" height="450" src="https://www.dailymotion.com/embed/video/x74rhrs" allowfullscreen allow="autoplay"></iframe>
Music by [Ilya Truhanov](https://icons8.com/music/author/ilya-truhanov) from [Fugue](https://icons8.com/music)

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
