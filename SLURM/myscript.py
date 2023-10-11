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
 
print("\nYour current version of python is")
print(sys.version)
print(sys.version_info)


## Second part of the script
time.sleep(60)
print("Now 60 seconds have passed since the last print")
print(time.time())


## Thrid part of the script
print("\nThird part")
print("Let's get data!\n")

import pandas as pd

mtcars = pd.read_csv('https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv')
print(mtcars.head())


# Fouth part
# Let's make correlations!
print("\nFourth part")
print("Let's make correlations!\n")

print("mpg~cyl\t",  mtcars.mpg.corr(mtcars.cyl))
print("mpg~disp\t",  mtcars.mpg.corr(mtcars.disp))
print("mpg~hp\t",  mtcars.mpg.corr(mtcars.hp))
print("mpg~drat\t",  mtcars.mpg.corr(mtcars.drat))
print("mpg~wt\t",  mtcars.mpg.corr(mtcars.wt))
print("mpg~qsec\t",  mtcars.mpg.corr(mtcars.qsec))
print("mpg~vs\t",  mtcars.mpg.corr(mtcars.vs))
print("mpg~am\t",  mtcars.mpg.corr(mtcars.am))
print("mpg~gear\t",  mtcars.mpg.corr(mtcars.gear))
print("mpg~carb\t",  mtcars.mpg.corr(mtcars.carb))
