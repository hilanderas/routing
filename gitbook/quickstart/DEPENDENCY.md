# Dependency

### Operating system
This project supports `ubuntu`.

### Install common used linux package 
Use the command `sudo apt install [command]` to install the command below:
* `make`
* `tree`
* `unzip`
* `vim`
* `python3`
* `python3-pip`

### Install NetworkManager and config interface mangement
```
sudo apt install network-manager -y
sudo nmcli device [need_interface] managed yes
sudo nmcli device
```

In case that devices/interfaces cannot be set as managed, please refer to [the possible solution here](https://askubuntu.com/questions/71159/network-manager-says-device-not-managed), in which
both `/etc/NetworkManager/NetworkManager.conf` and `/etc/NetworkManager/conf.d/10-globally-managed-devices.conf` are important.

### Install python package
Use the command `pip3 install [package]` to install the package below:
* `pyyaml`
* `argparse`
* `termcolor`
