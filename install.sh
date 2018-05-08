#

# This will probabl install files in your home directoy in 
# Maxima's search path

FILES="qinf.mac qinf.lisp qinf_utils.mac log2.mac"

mkdir ${HOME}/.maxima
echo cp -a ${FILES} ${HOME}/.maxima
cp -a ${FILES} ${HOME}/.maxima

