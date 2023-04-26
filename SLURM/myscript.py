## Python script

## Coding styles are given in the pep8
## https://peps.python.org/pep-0008/

## Libraries to import

import time
import os
import sys


## First part of the script
print("Hello ", os.getlogin(), "the current epoch (time in computers is:")
print(time.time())


## Second part of the script
time.sleep(60)
print("Now 60 seconds have passed since the last print")
print(time.time())


## Thrid part of the script 
print("\nYour current version of python is")
print(sys.version)
print(sys.version_info)
