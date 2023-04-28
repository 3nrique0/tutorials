## Introduction to Slurm

The aim of this tutorial is to give only basic usage for newcomers in SLURM.

The scripts here present are only examples with no real use, they can be used as a template.

This tutorial is aimed, for now, to users to use [Genotoul](https://bioinfo.genotoul.fr/) cluster. 
This being a basic tutorial it can be applied elsewhere.

This introduction will allow to open new questions to other subjects like:

* Introduction to Linux command line - bash
* File permissions
* Filesystem Hierarchy Standard (FHS)
* How computers work
* Advanced job launching in slurm (arrays)
* Advanced job management - without being an administrator
* Good practices
* Environments (module load)

During this workshop there are several steps that will cause an error.
They are necessary for new trainees to learn how to find, read and interpret errors.
It is an essential skill in order to become independent.

Have a good read :-)


--------

## The order of use of the scripts is suggested as following

### template_script.txt

A reminder of how a script is organised.

### myscript.sh

Very basic bash script to be launched with `bash` and with `sbatch`:

```bash
bash myscript.sh
sbatch myscript.sh
```

--------

## Launch python scripts

Python is a base program intepreter installed by default.
However it may not be the version you need.
The main python script is a file. It will be run with a launcher.
This encapsulation allows for your script to be exportable (to other clusers and other computers).
Thus the separation of the launching and the script itself is a sound idea.

Here we'll use a bash launcher for our python program

```bash
sbatch launch_py.sh
```

The launcher `launch_py.sh` contains all the parameters for sbatch, and can load an environment (`module load`) a different version of python.
This will run python on the server.
In this case the `output`, `error` and `mail` options are commented.
Remove the comment `#` and try again

--------

## Launch R scripts

R is not a default installation, if you try to run it it will fail, there will be an error.
It will require to load the environment required to access R.
In other clusters you can use miniconda to create an Rstat environment.
The same thing can be applied to a large amount of programs, like BWA, FastQC, etc

```bash
sbatch launch_R.sh
```

Here you can keep changing and adding parameters to sbatch.
In this case the `output` and `error` files are given a name.
This means that when you re-launch the script, these files will be overwritten.

In this case I'd like you to learn how to get that png created back to your computer.
