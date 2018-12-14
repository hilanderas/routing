#!/usr/bin/env python3
"""
"""

import os
from termcolor import colored
import argparse

class Validator():
    """The file validator."""

    def __init__(self, args):
        """The initial arguments of validator.

        Arguments:
            args: A dict with key 'file' and 'exp'.
            file: The absolute path of a file or directory.
            exp: The expectation of the existence of file. Must be a bool.
        """
        self.filepath = args['file']
        self.exp = args['exp']

    def ifexist(self, path):
        """Check the existence of [path].

        Arguments:
            path: A absolute path of a file or directory.

        Return:
            result: The result of whether path of file exist and the message.
        """
        result = {}
        exist = os.path.exists(path)
        if exist:
            msg = path+" exists."
        else:
            msg = path+" does not exist."
        result['file'] = path
        result['exist'] = exist
        result['message'] = msg
        return result

    def output(self, expectation, current, message):
        """
        """
        if expectation == current:
            print(colored("[True]", "green"), end=' ')
        else:
            print(colored("[False]", "red"), end='')
        
        print(message)

    def validate(self):
        result = self.ifexist(self.filepath)
        exist = result['exist']
        msg = result['message']
        self.output(self.exp, exist, msg)

class Cli():
    """The command line interface of validator."""

    def __init__(self, validator):
        """The initial arguments of Cli.

        Arguments:
            validator: The class object of validator.
            args: The arguments.
        """
        self.val = validator
        self.args = vars(self._define_parse().parse_args())

    def _define_parse(self):
        """Parse arguments from user.

        Arguments:
            -f: The absolute path of a file or directory.
            -e: The expectation of the existence of file. Must be a bool.

        Return:
            parser: The arguments parser. 
        """
        parser = argparse.ArgumentParser(description="Validate file.")
        parser.add_argument('-f', '--file', dest="file", help="The absolute path of the file that need to validate.")
        parser.add_argument('-e', '--expectation', dest="exp", action="store_false", help="The expectation of the existence of file. Must be a bool. The default value is True.")

        return parser

    def run(self):
        """Run the validation process."""
        validator = self.val(self.args)
        validator.validate()


if __name__ == "__main__":
    CLI = Cli(Validator)
    CLI.run()