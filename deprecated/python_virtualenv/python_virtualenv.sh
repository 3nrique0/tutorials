#!/bin/bash

######################################################
## Install pip if not installed

## if python 2.7 is default, this will install the pip version for 2.7
sudo apt-get install pip

## if you require pip for python 3.X install with
sudo apt-get install python3-pip

## Update pip
pip install --upgrade pip

## Create a directory to store all the virtual environments
mkdir ~/envs
cd ~/envs
######################################################


######################################################
## Install virtualenv
pip3 install virtualenv
#pip install virtualenv    ## In case virtualenv was installed for 2.7

######################################################




######################################################
## Install packages and dependencies required for GOATOOLS to work
## To be installed once the virtual environment has been created

pip3 install numpy
pip3 install fisher 
pip3 install statsmodels
pip3 install goatools

######################################################




######################################################
## Create virtual environment:
## This will create a directory, py35, which will contain the virtual
## environment using python 3.5 (latest release available on ubuntu repositories)

## Go to the environments directory : ~/envs
cd ~/envs

## Create virtual environment and give it a name
virtualenv -p /usr/bin/python3.5 py35

## Activate virtual environment
source py35/bin/activate

## Install packages and dependencies required for GOATOOLS to wor
pip3 install numpy
pip3 install fisher 
pip3 install statsmodels
pip3 install goatools

## Keep a list of libraries required to the use of GOATOOLS
pip freeze --local > requirementsGOATOOLS.txt

## Deactivate the virtual environment
#deactivate
######################################################



######################################################
## Create virtual environments from a list of required libraries:

## Go to the environments directory : ~/envs
cd ~/envs

## Create virtual environment and give it a name
virtualenv -p /usr/bin/python3.5 py35

## Activate virtual environment
source py35/bin/activate

## install dependencies from a list created by pip:
pip3 install -r requirementsGOATOOLS.txt

#####################################################
