"""
"""

import os

class PPP_Generator():
    """Generate pppoe configuration."""

    def __init__(self, info, dest):
        """The initial arguments of generator.

        Arguments:
            info: The dict of info.
            dest: The destination where the configuration are generated.
        """
        self.dest = dest
        self.NIF = info["NIF"]
        self.user = info["user"]
        self.passwd = info["pass"]
        self.unit = str(info["unit"])

    def gen_wan(self, NIF, unit, dest):
        """Generate wan network interface file.

        Arguments:
            NIF: Network interface name.
            dest: The destination where the configuration are generated.
        """
        wan = \
            "auto "+NIF+"\n"\
            "iface "+NIF+" inet ppp\n"\
                "\tpre-up /sbin/ip link set dev "+NIF+" up\n"\
                "\tprovider dsl-"+NIF+"\n"\
                "\tunit "+unit+"\n"\
                "\tpost-down /sbin/ip link set dev "+NIF+" down"

        wan_file = dest+"/wan-"+NIF
        print("Generate wan interface file: "+wan_file)

        # create directory if does not exist.
        os.makedirs(dest, exist_ok=True)

        with open(wan_file, 'w') as f:
            f.write(wan)

        with open(wan_file, 'r') as f:
            print(f.readlines())

    def gen_peer(self, user, NIF, dest):
        """Generate peer file.

        Arguments:
            user: The user of pppoe authority.
            NIF: The network interface name.
            dest: The destination where the configuration are generated.
        """
        peer = \
            "user "+user+'\n'\
            "plugin rp-pppoe.so "+NIF+'\n'\
            "noipdefault\n"\
            "defaultroute\n"\
            "replacedefaultroute\n"\
            "hide-password\n"\
            "noauth\n"\
            "persist\n"\
            "usepeerdns\n"

        peer_file = dest+"/dsl-"+NIF
        print("Generate peer file: "+peer_file)
        
        # create directory if does not exist.
        os.makedirs(dest, exist_ok=True)
        
        with open(peer_file, 'w') as f:
            f.write(peer)

        with open(peer_file, 'r') as f:
            print(f.readlines())
        
    def gen_secret(self, user, passwd, dest):
        """Generate pppoe secrets.

        Arguments:
            user: The user of pppoe authority.
            passwd: The user of pppoe authority.
            dest: The destination where the configuration are generated.
        """
        secret = "\""+user+"\" * \""+passwd+"\" *\n"
        chap_secret = dest+"/chap-secrets"
        pap_secret = dest+"/pap-secrets"
        
        print("Generate pppoe secrets:")
        # create directory if does not exist.
        os.makedirs(dest, exist_ok=True)
        
        with open(chap_secret, 'a') as f:
            f.write(secret)
        with open(pap_secret, 'a') as f:
            f.write(secret)
        
        with open(chap_secret, 'r') as f:
            print(f.readlines())
        with open(pap_secret, 'r') as f:
            print(f.readlines())


    def generate(self):
        """Generate all configuration.

        Steps:
            1. Generate wan interface file.
            2. Generate peer files.
            3. Generate secret files.
        """
        self.gen_wan(self.NIF, self.unit, self.dest+"/interfaces.d")
        self.gen_peer(self.user, self.NIF, self.dest+"/peers")
        self.gen_secret(self.user, self.passwd, self.dest+"/secrets")
