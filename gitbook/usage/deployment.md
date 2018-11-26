# deployment

## Step 1: Connect 
Connect the machine that you want to config as a router to the ISP.

There are several ways to operate the router:
* Connect a screen to the router.
* Connect a machine that you can operate to the same network of router, so it can ssh to the router. 

## Step 2: Login the router
* If the router connects a screen, connect a keyboard to it and login.
* If another machine is in the same network with router.
    ```bash
    ssh [user]@[ip/hostname]
    ```
    * [user]: The user name of router.
    * [ip/hostname]: The ip of router or the hostname of router.

## Step 3: Download package
Now, you are on the router.

Download the routing package:
```bash
wget https://github.com/elespejo/routing/releases/download/[version]/routing-[ubuntu_version]-[scenario]-[version].zip
```
The explanation of package name:
* [ubuntu_version]: The version of the router's ubuntu operating system.
* [scenario]: The scenario of how router get ip from ISP.
* [version]: The routing version.

> Check all available packages in [release page](https://github.com/elespejo/routing/releases).

## Step 4: Unzip and check
* Unzip the package
    ```bash
    unzip routing-[ubuntu_version]-[scenario]-[version].zip
    ```
* Check md5
    ```bash
    cd dev-[ubuntu_version]-[scenario]/
    md5sum -C [ubuntu_version]-[scenario]-[version].md5
    ```

## Step 5: Config routing
* Config routing:
    ```bash
    make config
    ```
* Test the config process:
    ```bash
    make test_config
    ```

## Step 6: Start routing
* Start routing:
    ```bash
    make start
    ```
* Test the start process:
    ```bash
    make test_config
    ```

## Step 7: Functionality test
After step 6, the routing project is running properly on router. 

Test the functionality:
1. Connect the router and another machine like the topology.
2. Set the machine a static ip that is in the same network with router's lan.
3. Connection between machine and router's lan is ok.
    ```bash
    ping [lan ip of router]
    ```
4. Connection between machine and router's wan is ok.
    ```bash
    ping [wan ip of router]
    ```

e.g:
1. You connect devices like this:
    ```
     ________    __________ISP_________    __________router___________    ____machine____
    |        |  |wan                lan|  |wan                     lan|  |wan            |
    |internet+--+           192.168.0.1+--+192.168.0.5    192.168.20.1+--+192.168.20.5   |
    |________|  |______________________|  |___________________________|  |_______________|
    
    ```
2. On machine:
    ```bash
    ping 192.168.20.1
    ```

3. On machine:
    ```bash
    ping 192.168.0.1
    ```

## Step 8: Stop routing
* Stop routing:
    ```bash
    make stop
    ```
* Test the stop process:
    ```bash
    make test_stop
    ```

## Step 9: restore routing
* Restore routing:
    ```bash
    make restore
    ```
* Test the restore process:
    ```bash
    make test_restore
    ```