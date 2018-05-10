# *qinf* quantum information library for *Maxima*

qinf is a quantum information package for the
[Maxima](http://maxima.sourceforge.net/) computer algebra system. The
motivation for this package is for reproducible research. An example
verifying calculations in a paper is included: [doc/qinf.pdf](doc/qinf.pdf).

qinf implements objects used in quantum information theory--- operators,
vectors, tensors, etc. These objects are typically represented in this
package  as row and column vectors and matrices, whose
entries may be explicit numbers or algebraic expressions. This software
occupies a niche distinct from high performance numerical linear algebra
software as well as software such as the Maxima tensor packages that
manipulate abstract mathematical objects.

## Installation

To use this package, copy all of the files in the  [./src/](./src/) directory to your
`.maxima/` directory, or other directory in Maxima's search path. For
unix/linux, there is a script `./install.sh` that does this for you.

## Using qinf

At the Maxima prompt give the following command.
```
load("qinf.mac");
```

## Testing

Under unix/linx/mac os, [runtests.sh](runtests.sh) runs the tests.
This file just runs the command `maxima -b runtests.mac`.
In turn, [runtests.mac](runtests.mac) first sets Maxima's search paths so that
files in [./src/](./src/) and [./test/](./test/) are found, and then runs
some tests.

## Documentation

Documentation is here: [doc/qinf.pdf](doc/qinf.pdf).

## Examples

See the code in [./examples/](./examples). The code used in
the user's guide, [doc/qinf.pdf](doc/qinf.pdf), is in [./code_for_user_guide/](./code_for_user_guide/).

Contributed code is found in [./contributed/](./contributed/).

## Relation to other projects

In working on this project, it became clear that translating existing
symbolic quantum information libraries could be productive. Then, I began
to write Mathematica compatibility functions in Maxima to make this translation
easier. This lead to the [Mixima](https://github.com/jlapeyre/mixima) project
which includes many such compatibility functions and a transcoder from Mathematica
to Maxima. Included in the Mixima repo is
a translation of Robert Griffiths' [Quantum Information Programs in Mathematica](http://quantum.phys.cmu.edu/QPM/).

While Mixima is useful, it has limitations arising from the different designs of Mathematica and Maxima.
I addressed these, and other needs for Maxima in the project [mext](https://github.com/jlapeyre/mext).
With the arrival of the Julia language, it became feasible to write a CAS from scratch.
So, I then started the [Symata](https://github.com/jlapeyre/Symata.jl) project in Julia.
Symata is a symbolic language similar to Maxima, Maple, and Mathematica.

<!--  LocalWords:  qinf Maxima's unix linux os runtests subdirectory repo
 -->
<!--  LocalWords:  cd rtest ptrace Mathematica Mixima transcoder Griffiths
 -->
<!--  LocalWords:  mext Symata
 -->
