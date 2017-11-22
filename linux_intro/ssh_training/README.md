```
   _______________             _______________
  |  ___________  |           |  ___________  |
  | |           | |           | |           | |
  | |   0   0   | |           | |   0   0   | |
  | |     -     | |           | |     -     | |
  | |   \___/   | |           | |   \___/   | |
  | |___     ___| |           | |___________| |
  |_____|\_/|_____|           |_______________|
    _|__|/ \|_|_.......SSH......._|________|_
   / ********** \               / ********** \
 /  ************  \           /  ************  \
--------------------         --------------------
        LOCAL                        HOST
```

# SSH - Remote login

## Objective

* Learn how to connect to a distant computer
* Get used to using the full path of files and directories
* Get used to using shortcuts like here (.), parent directory (..) and home (~)
* Learn how to edit a file on the terminal
* Learn how to copy a file from the host to the local computer
* Learn how to copy a file from the local computer to the host

---

## Other things to remember ?

### How a command is made:
```
command -parameter1 -parameter2 argument1 argument2
```

Some basic commands:
`ls` (and `ll`), `cd`, `pwd`, `cp`

Symbols to remember:
* `.` here, this directory
* `..`	parent directory
* `~`	Home directory, /home/user/
* `^`	Control key (ctrl)
* `>`	Redirect output (stdout) to a file, remove any content of the file if it exists, create the file if it doesn't exist
* `>>`	Append output (stdout) to a file, create the file if it doesn't exist



### Other stuff ?

Terminals and file names are case-sensitive.

* `user`  Your user-name in the computer, all in lower-case.
* `User`  Your name or user-name with a capital letter.
* Copy in a terminal:		`Shift + Ctrl + c`
* Paste in a terminal:	`Shift + Ctrl + v`



---

## Definitions and requirements

Secure SHell is a cryptographic network protocol often used to remote login to a distant computer.

Your computer will be named "local computer" or your "terminal".
The distant computer will be named "host".


To initiate a distant session on a computer you'll need to have 3 things:

1. Be on the same network than the host. You can use a VPN for this
2. Find the name of the computer, or it's IP address in that network
3. Have an account in the host

You will be provided witn a user name and a password on a local computer

---

## First part : Connect, explore and copy


### Connection

Use the command `ssh user@host`:

Example:

```bash
$ ssh john@distant.computer.com
$ ssh john@15.8.13.42
```


### Explore */home/*

When you log in your current working directory will be by default */home/user/*.
Go to the parent directory:
```bash
$ cd ..
```

What do you see ? (`$ ll`)
> The list of home directories for all the users

#### Can you explore someone else's home directory ?

$ cd enrique/

Can you distinguish files, executable files and directories ?
Which directories can you access ?
> Use `$ll` and check the permissions.

What happens when you try to access a directory for which you don't have the rights ?



### Copy the exercise directory

Go to */home/enrique/Documents/git_stuff/tutorials/linux_intro/*
```bash
$ cd /home/enrique/Documents/git_stuff/tutorials/linux_intro/
```

Copy the full directory into your home directory.
Don't forget to use the parameter **-r** (recurrent) to copy the directory and all it's contents
```bash
$ cp -r ssh_training ~
```

Go to the copy you just created:

```bash
$ cd ~/ssh_training
```


### Explore the file hierarchy

You can explore the directories one by one using `$ ls directory`
or you can explore them all at once using
```bash
$ ls -R
```

Can you describe the result ?
Can you find a file with your name ?

---


## Second part: Edit a file, compare and copy


### Edit a file

We will be using **nano** to edit a file in the terminal.

* Why nano ?
> Because it's easy to use and installed by default in all linux distributions.

* Why in the terminal ?
> Because the Graphic User Interface (GUI) is very limited, it is more efficient to work straight in the terminal.

* Are there other programs to do the same ?
> Yes, the most usuall are **vim** and **emacs**. We will not use them since they are more complicated to use


Go to the directory containing the files with your name:
```bash
$ cd ~/ssh_training/Results
```

Read the file with your name:
```bash
$ less User
```

#### Edit the file
```bash
$ nano User
```
Nano controls are in the bottom of the screen. Try them, experiment with them, feel comfortable with them.


Modify the text wherever you want to modify it, adding "##" before the text.


#### Chunk a file text and append it to a file

There are different ways to get a piece of text:

* `$ cat` then copy/paste a piece of it.
* `$ head -n` to get **n** lines from the begining of the text.
* `$ tail -n` to get **n** lines from the bottom of the text.

You can mix them togheter:
```bash
$ head -20 ~/ssh_training/Raw_data/exp2/sgtpepper | tail -5 >> User
```
Check the result
```bash
$ less User
```


#### What did other people do ?

If users allow you the rights to read their files, you can see what they did:

Get the correct full path (URL) of their file there are 2 possibilities:



1. You can **copy/paste** your own working directory and replace *user* and *User* to see what other people have done
```bash
$ pwd
/home/user/ssh_training/Results/User
$ less /home/john/ssh_training/Results/John
```

2. Use the **tab** key to autocomplete the full name of the file.
```bash
$ less /home/john/ssh_training/Results/John
```
---

##  Coming for next session:

- Can you edit or modify files on your collegues folders ?
- Can you create a file or a directory in your collegues folders ?
- How can you stop people from editing your files ?
- How to have a private directory ?
---> A bit about ethics.
	- privacy
	- sharing
	- team work
	- ownership in the computer
	- ownership in real life (IRL)
