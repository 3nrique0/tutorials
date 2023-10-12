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

## How it is organized with the rest ?

In a schematic way we could say that the _commands_ go into your _analysis script_.
The _analysis script_ is launched into the cluster with the _launcher.sh_.

> `commands` -> `myscript.[R | py | jl | pl | sh | cpp | jar ]` -> `launcher.sh`

--------

In order to launch a _script_ or _command_ in slurm, one must put it in a _shell script_.
This script can be named wrapper or launcher, or whatever you want.
Keep the name explicit and easy for future you :smiley:



## The order of use of the scripts is suggested as following

### template_script.txt

A reminder of how a script is organised.

### firstScript.sh

Very basic bash script to be launched with `bash` and with `sbatch`:

```bash
bash firstScript.sh
sbatch firstScript.sh
```
You can explore the output of the program launched with `bash` or `sbatch`


### Launch scripts that do similar things

There are 3 scripts that do similar things from the same dataset.
This will allow to introduce the `module` command to load specific tools installed in the server.

--------


## Launch a bash script

Bash is a Unix shell and a _command language_.
It was one of the first languages to be ported to Linux.
It is the default shell used in Linux, it is used as a _command processor_ (interactive session on your terminal).
It can read and execute commands from a file named a _shell script_

In this _shell script_ we'll only use commands present in bash, no extra software.
It will work as the previous example.


```bash
bash myscript.sh
sbatch myscript.sh
```


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

The launcher `launch_py.sh` contains all the parameters for sbatch.
The launch will fail upon the first launch.
Only one part of the script will run, the other requires to load an environment (`module load`) with a different version of python.

- [ ] Launch the script as it is
- [ ] Use the command `squeue -u $USER` to see the status of your job
- [ ] Explore the outputs
- [ ] What happens if you load the environment on your terminal before launching ?
- [ ] Edit the script to uncomment the line containing module

### Let's try more parameters of SLURM
In this script the `output`, `error` and `mail` options are commented.
Remove the comment `#` and try again

Ed

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
