import argparse
import confgenerator.generator as GEN
import confgenerator.validator as VAL

class PPP_Cli():
    """The Command-Line Interface of ppp configuration generator."""

    def __init__(self, generator, validator):
        """The initial arguments of the CLI.
        Arguments:
            gen: The object of generator.
            val: The object of validator.
            parser: The argument parser.
        """
        self.gen = generator
        self.val = validator
        self.parser = self._parse_arg()

    def _parse_arg(self):
        """Definition of the argument parser.
        Parser definition:
            -f: The path to info file.
            -d: The destination of configuration generation.
        
        Return:
            parser: The argument parser.
        """
        parser = argparse.ArgumentParser(description="Generate ppp configuration.")
        parser.add_argument('-f', dest="info-file")
        parser.add_argument('-d', dest="dest")

        return parser

    def gen_conf(self):
        """Generate configuration.
        Steps:
            1. Get the arguments info-file and dest from parser.
            2. Use validator to validate and get info.
            3. Use generator to generate configuration.
        """
        args = vars(self.parser.parse_args())
        info_file = args["info-file"]
        dest = args["dest"]

        # validate the info
        validator = self.val.PPP_Validator(info_file)
        infos = validator.validate()

        # generate configuration
        for info in infos:
            generator = self.gen.PPP_Generator(info, dest)
            generator.generate()


if __name__ == "__main__":
    CLI = PPP_Cli(GEN, VAL)
    CLI.gen_conf()
    
