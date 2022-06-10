# Install
<iframe frameborder="0" width="100%" height="450" src="https://www.dailymotion.com/embed/video/x74rhrs" allowfullscreen allow="autoplay"></iframe>
Music by [Ilya Truhanov](https://icons8.com/music/author/ilya-truhanov) from [Fugue](https://icons8.com/music)

### Login the machine you want to configure as a router
``` 
ssh [USER]@[IP/HOSTNAME]
```

### Download package and unzip
Choose one package to download according to your topology

e.g, WAN is dhcp mode for ubuntu 18.04
``` 
wget https://github.com/hilanderas/routing/releases/download/0.0.25/routing-18.04-dhcp-single-0.0.25.zip
unzip routing-18.04-dhcp-single-0.0.25.zip
```

> Check all available packages in [release page](https://github.com/elespejo/routing/releases).

### Install routing

#### Entry working directory
```
cd dev-16.04-dhcp-single
```

#### Config lan and wan
``` 
make config 
```

#### Assemble wires correctly
```
make start
```

### Check states
``` 
make test_state
```

The state should be in running after installation.
