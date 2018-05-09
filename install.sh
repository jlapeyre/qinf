#!/bin/sh

# This will install files in your home directory in
# Maxima's search path.

FILES=' qinf.mac qinf.lisp qinf_utils.mac log2.mac  mmacompat.mac mmacompat_lisp.lisp '

mkdir ${HOME}/.maxima
echo "cd src && cp -a ${FILES} ${HOME}/.maxima"
cd src && cp -a ${FILES} ${HOME}/.maxima
