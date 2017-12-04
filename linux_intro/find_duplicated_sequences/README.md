# Finding duplicated sequences in a fasta file.

We will create a script that will print out how many repeated sequences are there in a fasta file, and in which line they are located.

I know there are other ways of doing this. The main objective is to work on a command line to feel more comfortable using it, as well as practice a bit and understand what we are doing.

Enjoy !

---

## Check the End Of Line character (EOL)

In raw text files, there is a character that allows the computer to know when to go to the next line. It's named an End Of Line (EOL).
This are named **Control Characters**. There are a [lot of them](https://en.wikipedia.org/wiki/Control_character)
There are different characters depending if you are working on a Linux, Windows.

For now we need to know whether of not this characters are going to be understood by our linux terminal.

The characters we are looking for are:
* Linux: *LF*, Line Feed, `\n`
* Comodore: *CR*, Carriage Return, `\r`  -- This is rare to find, but, better be sure
* Windows: *CR+LF* Carriage Return and Line Feed, '\r\n'


### Check the ASCII code, for humans !!

Firstly we will use a *hexadecimal dump* to show the hexadecimal code for each character of the file, and use a parameter to convert the hexadecimal into a language we can understand.

```bash
hexdump -c Gm_Versions_All.fasta
```

Can you Identify what kind of EOL is present in this file ?

> Look for the different EOL characters in the file

How can you convert it to LF version ?

> Use [Notpad++](https://notepad-plus-plus.org/)

Does this arrives often ? Can we make things faster and automatic ?

> Yes we can, we often use the command `dos2unix`. It is not a standard tool, so you'll need to install it from a **repository** or from their [website](https://sourceforge.net/projects/dos2unix/).


Are we ready to get to the real work ?

> Yes !! Remember to always check for the little things that will cause problems.

---

## Are this one-line fasta ?

You can use `less -N` to see if your fasta file is a one-line fasta.
If it is, go to the next section. Else we have the answer.

We will follow 2 steps:
1. Remove the EOL from the sequence, not from the headers, nor from the last letter of the sequence.
2. Remove all empty lines from the file.

### Converting multi-line fasta into one-line fasta

We'll use this command:
```
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}'
```

It will look for lines starting with `>`, if they do, it will add a EOL at the begining and at the end of the line. Else it will remove the EOL. At the end, it will add an EOL to the end of the last sequence.


Check the file with `less -N`. Can you notice the first empty line ?


### Remove all the empty lines from the file

There are 2 ways, `sed` or `grep`.

This is what an empty line looks in a REGEX: `^$`, it means begining of the line (`^`) followed by end of the line (`$`) with **Nothing in the middle**

#### Sed to replace/delete strings

Sed allows to replace/delete strings. So we will delete the empty lines. The parameter used is `-i`, which means *in place*:

```bash
sed -i '/^$/d' file
```

#### Grep to choose the non empty lines

We'll only print the non empty lines using the parameter `-v`, for *inVerse*.


```bash
grep -v '^$' file > newfile
```
