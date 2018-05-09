TEX = pdflatex
MAKEINDEX = makeindex
BIBTEX = bibtex

# TEXSRC = qinf.tex

all : qinf.pdf

%.pdf : %.tex
	$(TEX) $<
	$(BIBTEX) $*
	$(TEX) $<
	$(MAKEINDEX) $*
	$(TEX) $<

.PHONY: clean
clean :
	-rm *.log *.aux *.idx *.out *.toc *.bbl *.blg *.dvi *.ilg *.ind
	-rm -rf auto/

realclean : clean
	-rm qinf.pdf
