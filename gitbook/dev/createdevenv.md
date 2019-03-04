# How to create development environment ?

### Step 1: Choose the real platform environment
* Depends on the `OS_VERSION` you are developing for, `16.04` or `18.04`.
* Depends on the number of `NIC` interfaces you are developing for, `single` or `dual`.

### Step 2: Download the project
* Log into the real platform
* Clone the project 
```
git clone https://github.com/hilanderas/routing.git
```

### Step 3: Create workspace
```
cd routing
make create-dev OS_VERSION=18.04 WAN_MODE=dhcp ROUTE_NUM=single
```

A directory called `dev-18.04-dhcp-single` is generated as your workspace. And options for each parameters are:
* `OS_VERSION`: `16.04`, `18.04`
* `WAN_MODE`: `dhcp`, `pppoe`
* `ROUTE_NUM`: `single`, `dual`

### Step 4:  
