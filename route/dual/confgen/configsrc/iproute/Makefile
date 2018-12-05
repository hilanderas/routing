include /etc/routing/setting.env

.PHONY: start
start:
	ip route del default
	ip route add default scope global \
        nexthop dev $(WAN1) weight 1 \
        nexthop dev $(WAN2) weight 1

stop:
	ip route del default
