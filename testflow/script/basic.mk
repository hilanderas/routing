#!make 
include .env
LIB=".env"

.PHONY: download rm_download
download:
	wget https://github.com/hilanderas/${PROJECT}/releases/download/${PROJ_VERSION}/${PROJECT}-${PROJ_VERSION}.zip
	unzip ${PROJECT}-${PROJ_VERSION}.zip

rm_download:
	rm -rf ${PROJECT}*


.PHONY: config read_config init_config 
config: 
	sed -i '/TEST_PROJ/c\export TEST_PROJ=${TEST_PROJ}' ${LIB}


read_config:
	cat ${LIB} | grep "TEST_PROJ"

.PHONY: reset_env
reset_config:
	sed -i '/TEST_PROJ/c\export TEST_PROJ=../../ctl' ${LIB}
	sed -i '/TESTMODE/c\export TESTMODE=dev' ${LIB}
	cat ${LIB}

.PHONY: set_mod read_mod 
set_mod:
	sed -i '/TESTMODE/c\export TESTMODE=${TESTMODE}' ${LIB}
read_mod:
	printenv TESTMODE


.PHONY: hint confirm re_boot
hint:
		GREEN='\033[0;32m'
		NC='\033[0m' # No Color
		printf "${GREEN}=================================${NC}\n"
		printf "${GREEN}${CONTENT}${NC}\n"
		printf "${GREEN}=================================${NC}\n"

confirm:
		@( read -p "Are you sure?!? [y/N]: " sure && case "$$sure" in [yY]) true;; *) false;; esac )

re_boot:
		sudo reboot


