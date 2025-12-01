#!/usr/bin/env python3
import os
import getpass
import pathlib

print("Current user      :", getpass.getuser())
print("Current directory :", pathlib.Path().absolute())
print("APP_ENV           :", os.getenv("APP_ENV", "not set (default=development)"))
