#!/bin/sh

# This will probably install files in your home directoy in 
# Maxima's search path

FILES=' qinf.mac qinf.lisp qinf_utils.mac log2.mac  mmacompat.mac mmacompat_lisp.lisp '

INSTDIR=${HOME}/.maxima

echo "cd ${INSTDIR} && rm ${FILES}"
cd ${INSTDIR} && rm ${FILES}

