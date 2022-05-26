import os
import uuid

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
        self.user = str(info["user"])
        self.passwd = str(info["pass"])
        self.unit = "pppoe_home_"+str(info["unit"])

    def generate(self):
        """Generate NetworkManager pppoe config file
        """
        conf_temp = '[connection]\n'\
        'id={}\n'\
        'uuid={}\n'\
        'type=pppoe\n'\
        'autoconnect=false\n'\
        'interface-name={}\n'\
        '\n'\
        '[pppoe]\n'\
        'password={}\n'\
        'username={}\n'\
        '\n'\
        '[ipv4]\n'\
        'method=auto\n'\
        '\n'\
        '[ipv6]\n'\
        'addr-gen-mode=stable-privacy\n'\
        'method=disabled\n'\
        '\n'\
        '[proxy]'

        conf = conf_temp.format(self.unit, str(uuid.uuid4()), self.NIF, self.passwd, self.user)

        ppp_file = "{}/{}.nmconnection".format(self.dest, self.unit)
        print("Generate wan interface file: "+ppp_file)

        # create directory if does not exist.
        os.makedirs(self.dest, exist_ok=True)

        with open(ppp_file, 'w') as f:
            f.write(conf)

