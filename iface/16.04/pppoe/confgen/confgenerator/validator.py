"""
"""

import os
import yaml

class PPP_Validator():
    """The validator of info file."""

    def __init__(self, info_file):
        """The initial argument of validator. 
        
        Argument:
            info_file: the path of info file.
        """
        self.info_file = info_file
        self.result = {}

    def file_exist(self, file_path):
        """Check whether [file_path] exists
        
        Argument:
            file_path: The absolute path of a file.

        Exception:
            OSError: The argument is not a absolute path or not a file.
        """
        print("Check file path whether is absolute or a file:", end=' ')
        try:
            if not os.path.isabs(file_path):
                raise Exception(file_path+" is not a absolute path!")
            elif not os.path.isfile(file_path):
                raise Exception(file_path+" is not a file!")
            else:
                print("True")
        except Exception as exc:
            print(exc)
            raise SystemExit

    def load_yaml(self, yaml_file):
        """Load the yaml file.
        
        Argument:
            yaml_file: The path of the yaml file.

        Return:
            yaml_dict: The dict of the yaml file.
        
        Exception:
            YAMLError: The official exception in package yaml.
        """
        print("Load the info file:")
        with open(yaml_file, 'r') as f:
            try:
                yaml_dict = yaml.load(f)
            except yaml.YAMLError as exc:
                print(exc)

        print('\t', yaml_dict)
        return yaml_dict

    def validate_info(self, info):
        """Validate the info dict.

        Argument:
            info: a info dict.

        Return:
            bool: Whether the info is correct.
            msg: message 
        """
        correct_key = ["NIF", "user", "pass"]
        try:
            print("Check the info format:", end=' ')
            print(info)
            for key in correct_key:
                print("- check "+key+":", end=' ')
                if not key in info:
                    raise Exception(key+" is not exist!")
                elif not info[key]:
                    raise Exception("The value of "+key+" can not be null!")
                else:
                    print("True")
        except Exception as exc:
            print(exc)
            raise SystemExit

    def validate(self):
        """The steps of ppp info validation.

        Steps:
            1. check whether info file exist.
            2. load the info yaml file.
            3. check whether keys are correct.
            4. check whether values are correct.

        Return:
            infos: The list of info.
        """
        self.file_exist(self.info_file)
        infos = self.load_yaml(self.info_file)
        NUM = 0
        for info in infos:
            self.validate_info(info)
            info["unit"] = NUM
            NUM += 1
        return infos
 