# Setting up Python virtual environments

If you have or require different versions of python with a different set of libraries,
or if one of the programs you are using requires a particular python set-up that doesn't match
your regular needs, stay a bit and read along.

The commands in this README file are also present as a bash script in the same directory.





## 1. Install pip

Some linux distributions already have 2 versions of python installed as default 2.7.X and 3.X.X,
check the links and executables installed and chose the one to work with.

```bash
ls -l /usr/bin/pyt*
```

Choose the default version of python you would like to use.
Beware not to update this version, since the libraries to use _virtualenv_ will depend on it.
We'll create virtual environments for the other versions you'd like to use.




### a. Install pip on 2.7.X

As of today, july 2017, `pip` will install pip on python 2.7.X.
After the installation you'll probably have to update it

```bash
sudo apt-get install pip
pip install --upgrade pip
```



### b. Install pip on 3.X.X

It's almost the same thing

```bash
sudo apt-get install python3-pip
```





## 2. Install virtualenv library

For 2.7.X:

```bash
pip install virtualenv
```

For 3.X.X:

```bash
pip3 install virtualenv
```





## 3. Create a directory where your environments will all be stored

The tutorials advise to put this directory in your home, so let's follow their directions

```bash
mkdir ~/Environments
```






## 4. Create an environment

To create an environment you need to call `virtualenv`,
give it a path (**-p**)to an executable python version,
the default python will be taken if no argument is provided,
and a name for your environment.
The environment will be created by default in the current directory.




### a. Create and activate the environment

Creation of a python environment with the 3.5 version named *py35*

```bash
cd ~/Environments
virtualenv -p /usr/bin/python3.5 py35
```

To "turn on" the environment source the activate executable from that environment:

```
source ~/Environments/py35/bin/activate
```

A little reminder of the environment you are using should appear in the prompt




### b. Install the required libraries

Pip will allow you to install some libraries for python,
these libraries will only be available in the environment which is currently in use.

```bash
pip3 install numpy
pip3 install fisher
pip3 install statsmodels
pip3 install goatools
```



### c. Create an environment from a previous list of libraries

Once you created an environment which is functionnal and
you saved the list and version of the libraries used,
you can re-use that list to install all the libraries  at the right versions at once.
To create the list of libraries, read further in this file.

```bash
cd ~/envs
virtualenv -p /usr/bin/python3.5 py35bis
source py35/bin/activate
pip3 install -r py35.txt
```



### d. Quitting your environment

To quit the environmment simply type `deactivate`

```bash
deactivate
```





## 5. Saving list of libraries and Removing a virtual environment



### a. Save the list of libraries installed and used in an environment

Getting a list of the libraries and their versions is helpful,
either in case you would like to copy/recreate this environment or
in case you want to give a proper list of the libraries and versions required to run a given script.

```bash
pip freeze --local > py35.txt
```


### b. Remove a virtual environment

Once you don't require anymore a given virtual environment the way to remove it is to remove it's
directory

```bash
rm -rf ~/Environments/py35/
```



## SOURCES

* Goatools: https://github.com/tanghaibao/goatools
* GO_enrichment : https://github.com/enormandeau/go_enrichment
* http://python-guide-pt-br.readthedocs.io/en/latest/dev/virtualenvs/
* Video tutorial for virtualenvs: https://www.youtube.com/watch?v=N5vscPTWKOk
* http://www.simononsoftware.com/virtualenv-tutorial-part-2/
* https://iamzed.com/2009/05/07/a-primer-on-virtualenv/
