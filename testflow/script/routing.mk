#!make
include .env
ROUTING_PROJ=../..

#config: 
#	sed -i s/TEST_OS_VERSION\c/export TEST_OS_VERSION=${OS}/g
#	sed -i s/ TEST_WAN_MODE\c/export TEST_WAN_MODE=${WAN}/g
#	sed -i s/TEST_ROUTE_NUM\c/export TEST_ROUTE_NUM=${NUM}/g

create-proj-18-s-dhcp: 
	make -C ${ROUTING_PROJ} create-dev OS_VERSION=18.04 WAN_MODE=dhcp ROUTE_NUM=single || true
	sed -i '/TEST_PROJ/c\export TEST_PROJ=../../dev-18.04-dhcp-single' .env
	cat .env
create-proj-16-s-dhcp:
	make -C ${ROUTING_PROJ} create-dev OS_VERSION=16.04 WAN_MODE=dhcp ROUTE_NUM=single || true
	sed -i '/TEST_PROJ/c\export TEST_PROJ=../../dev-16.04-dhcp-single' .env
	cat .env
create-proj-16-d-pppoe: 
	make -C ${ROUTING_PROJ} create-dev OS_VERSION=16.04 WAN_MODE=pppoe ROUTE_NUM=dual || true
	sed -i '/TEST_PROJ/c\export TEST_PROJ=../../dev-16.04-pppoe-dual' .env
	cat .env
create-proj-16-s-pppoe:
	make -C ${ROUTING_PROJ} create-dev OS_VERSION=16.04 WAN_MODE=pppoe ROUTE_NUM=single || true
	sed -i '/TEST_PROJ/c\export TEST_PROJ=../../dev-16.04-pppoe-single' .env
	cat .env

del-proj-18-s-dhcp:
	rm -rf ${ROUTING_PROJ}/dev-18.04-dhcp-single
	make -f basic.mk reset_config
del-proj-16-s-dhcp:
	rm -rf ${ROUTING_PROJ}/dev-16.04-dhcp-single
	make -f basic.mk reset_config
del-proj-16-dual-pppoe:
	rm -rf ${ROUTING_PROJ}/dev-16.04-pppoe-dual
	make -f basic.mk reset_config
del-proj-16-s-pppoe:
	rm -rf ${ROUTING_PROJ}/dev-16.04-pppoe-single
	make -f basic.mk reset_config


