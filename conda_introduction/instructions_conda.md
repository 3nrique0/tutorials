# Instructions for the practical of conda

----

## 1.- Installation


### Installing conda-forge

Download from conda-forge: https://conda-forge.org/download/
```
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
```

Run the installation script
```
bash Miniforge3-Linux-x86_64.sh
```

Press ENTER then SPACE until the end of the license agreement. Then type 
```Yes```

Accept or choose where to install it. (for this exercise use the default)

Do you wish to update your shell profile to automatically initialize conda?

```Yes```

------

### Check up installation

Update if necessary
```
conda --version
# if it doesn't work:
eval "$(/home/$USER/miniforge3/bin/conda shell.bash hook)"
```

Check the channels

```
conda config --show channels
```

----

### Add channels & set to strict

```
conda config --add channels bioconda
conda config --add channels nodefaults
```

Check the channels

```
conda config --show channels
```

Set channels to strict

```
conda config --set channel_priority strict
```


### Extras

Deactivate automatic start of the conda base environment
```
conda config --set auto_activate_base false
```

----
----

## 2.- Finding help

Some instructions allow to explore, not all commands are full, complete or accurate. The accurate commands are at *3.-*. Don't cheat :-)

### Find help - get the options

What can conda do ? - get help

```
conda
conda -h

conda install
conda install -h
```

Are there any options for create an environment ?



## 3.- Working with environments

### Create an environment 

```
# Empty env
conda create -n environment_name

# Environment with an install
conda create -n env_name python=3.5

# Environment from a YML file


# Simulate the creation of an environment - dry run

conda create -n potato -d
conda create -d -n potato python=3.6

```

### Activate, deactivate, switch

Activating un environment while another environment is active causes to switch environment.

```
conda activate env1
conda activate env2
conda deactivate
```

### Search for packages

Search online on the conda-forge website:
https://conda-forge.org/packages/

Search from the command line.

```
conda search urlpath 	  # with full name 
conda search pat	  	  # with partial name -> pattern anywhere in the name
conda search 'pat*'	  	# pattern starting with 'pat'
conda search r=3.		    # with partial version
conda search r=3.5.1  	# with full version
```

### Install packages

Basic install -- Choses best version (more recent and installable)

```
conda install r 

# Install from specific channels
conda install -c defaults -c conda-forge package_name


# Install multiple packages:
conda install python r

# Install a list of packages into a specific environment, myenv
conda install -n myenv scipy curl wheel


# Install a specific version of 'python' into an environment, myenv

conda install -p path/to/myenv python=3.11
```

### Uninstall packages - Remove environment

```
# Remove the package 'scipy' from the currently-active environment
conda remove scipy

# Remove a list of packages from an environemnt 'myenv'::
conda remove -n myenv scipy curl wheel

# Remove all packages from environment `myenv` and the environment itself
conda remove -n myenv --all
```


### Switch environments

List all environments
```
conda env list
```

Activating an environment will cause to switch to that environment
```
conda activate env1
conda activate env2
```


List packages of a given environment
```
# List all packages installed into the environment 'myenv'::
conda list -n myenv

# List all packages that begin with the letters "py", using regex::
conda list ^py

```


### Save an environment

Create a YML
```
conda env export > environment.yml
```

Create an environment from a yml.
The name of the environment is in the first line of the yml
```
conda env create --file environment.yml 
```

# Create conda environment from a yml file
conda env create --name potato --file environment.yml


## 4.- Fully remove conda

There may or may not be an `uninstall.sh` included into the conda directory
```
# Fully remove Anaconda
rm -rf ~/.condarc ~/.conda ~/.continuum

rm -rf ~/.condarc ~/.conda ~/miniconda3
```

Check your `~/.bashrc`  or `~/.bash_profile` for modifications made by the conda installer and clean it up.
