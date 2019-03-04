# How to check info
Info is the configuration for user to manage, there are 2 kinds of info in system:
* info - For running services
* info_queued - For replacing info

### Check info
Check info in RUNNING, CONFQUEUED state
```make
make showinfo
```
**Please note that you can't check info in INIT and CONFGENED state**


### Check info_queued
Check info_queued in CONFGEND, RUNNING, CONFQUEUED state
```make
make show_queued_info
```
**Please note that you can't check info_queued in INIT state**

