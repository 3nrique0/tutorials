## Basic run
qsub myscript.sh

## Specify a queue. cemeb.q is default in MBB
qsub -q cemeb.q myscript.sh

## Naming your job is mandatory
qsub -q cemeb.q -N potato myscript.sh

## I want the outputs on my current directory
qsub -q cemeb.q -N potato -cwd myscript.sh

## I want both outputs to be on the same file
qsub -q cemeb.q -N potato -cwd -j Y myscript.sh

## I want a nicer output name
qsub -q cemeb.q -N potato -cwd -j Y -o nicer_name myscript.sh

## It's annoying to write all the parameters here !
## use '#$' to declare the variables into the script i.e. myscriptparams.sh
qsub myscriptparams.sh

## Can I launch just one command ?
## Yes, but use binary
qsub -b Y 'good_morning'

