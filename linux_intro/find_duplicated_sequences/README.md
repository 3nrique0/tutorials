# Finding duplicated sequences in a fasta file.

We will create a script that will print out how many repeated sequences are there in a fasta file, and in which line they are located.

I know there are other ways of doing this. The main objective is to work on a command line to feel more comfortable using it, as well as practice a bit and understand what we are doing.

Enjoy !

---

## Formatting the input file

Most errors come form poorly formatted files.
The first part will be to check the formatting and to re-format the files.
You must be in full control of the files that you will work with.


### Check the End Of Line character (EOL)

In raw text files, there is a character that allows the computer to know when to go to the next line. It's named an End Of Line (EOL).
This are named **Control Characters**. There are a [lot of them](https://en.wikipedia.org/wiki/Control_character)
There are different characters depending if you are working on a Linux, Windows.

For now we need to know whether of not this characters are going to be understood by our linux terminal.

The characters we are looking for are:
* Linux: *LF*, Line Feed, `\n`.
* Comodore: *CR*, Carriage Return, `\r`  -- Legacy, not used anymore.
* Windows: *CR+LF* Carriage Return and Line Feed, `\r\n`.

| Type          | Character     | Meaning | System  |
| ------------- |:-------------:| --------|-------:|
| *LF*          | `\n`          | Line Feed | Linux |
| *CR*          | `\r`          | Carriage Return | Comodore |
| *CR+LF*       | `\r\n`        | Carriage Return + Line Feed | Windows |


### Check the ASCII code, for humans !!

Firstly we will use a **hexadecimal dump** to show the hexadecimal code for each character of the file, and use a parameter to convert the hexadecimal into a language we can understand.

```bash
hexdump -c Gm_Versions_All.fasta
```

Can you Identify what kind of EOL is present in this file ?

> Look for the different EOL characters in the file.

How can you convert it to LF version ?

> * On windows   [Notpad++](https://notepad-plus-plus.org/).
> * On Mac BBedit [BBEdit](https://www.barebones.com/products/bbedit/).
> * On Linux use Gedit, Geany.
> * If adventurous in a terminal, use VIM or EMACS.

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
```bash
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' file
```

It will look for lines starting with `>`, if they do, it will add a EOL at the begining and at the end of the line. Else it will remove the EOL. At the end, it will add an EOL to the end of the last sequence.


Check the file with `less -N`. Can you notice the first empty line ?


### Remove all the empty lines from the file

There are 2 ways, `sed` or `grep`.

This is what an empty line looks in a REGEX: `^$`, it means begining of the line (`^`) followed by end of the line (`$`) with **Nothing in the middle**.

#### Sed to replace/delete strings

Sed allows to replace/delete strings. So we will delete the empty lines. The parameter used is `-i`, which means *in place*. Sed stands for Stream EDitor.

```bash
sed -i '/^$/d' file
```

#### Extra exercise

Sed allows replace text.

Try `sed 's/A/-/' file` and compare it with `sed 's/A/-/g' file`.

> The first one will replace the first **A** of every line, whereas the second one will replace all the **A** s on all the file.

Try `sed 's/GT/-/g' file`.

> This will replace all the **GT** for one only **-**.

#### Grep to choose the non empty lines

We'll only print the non empty lines using the parameter `-v`, for *inVerse*.


```bash
grep -v '^$' file > newfile
```


---


## Finding strict duplicate sequences

In order to find strict duplicate sequnces we need to understand a bit how the computer works. What we are going to do is to *compare strings*. A single character of difference will cause the string to be different. The `uniq` command only compares the differences among neighbors in a file. So we need to sort the file. And of course, since we are compare the sequences we'll have to remove the headers.

What to do ?:
1. Remove the headers.
2. sort the sequences alphabetically -- It doesn't make sense biologically, but it's important for the algorithm.
3. Use the `uniq` function.


How many unique sequences are there ?
> `grep -v '^>' fastaSingleLine | sort | uniq -c | wc -l`

How many sequences are there in total ?
> `grep -v '^>' fastaSingleLine | wc -l`

Are there duplicates ? How to print them ?
> `grep -v '^>' $fastasingleline | sort | uniq -d`


### Do you have too many duplicates ?

1. Put the duplicated sequences in a new file.
2. Read the patterns you are looking for from a file with grep, and print the line number.

```bash
grep -v '^>' fastasingleline | sort | uniq -d > duplicated_sequences
grep -n -f duplicated_sequences fastasingleline
```
