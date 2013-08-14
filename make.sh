#! /bin/bash

OPTION=$1
F="rapport"
case "$OPTION"
in
	clean)
		rm *.acn *.aux *.glo *.ist *.log *.out *.acr *.alg *.bbl *.blg *.glg *.gls *.pdf *.toc
		;;
	glo)
		pdflatex $F && makeglossaries $F && pdflatex $F && makeglossaries $F && pdflatex $F
		;;
	bib)
		pdflatex $F && bibtex $F && pdflatex $F
		;;
	all)
		pdflatex $F && bibtex $F && makeglossaries $F && pdflatex $F && makeglossaries $F && bibtex $F && pdflatex $F && pdflatex $F
		;;
	cleanall)
		./make.sh clean; ./make.sh all
		;;
	*)
		pdflatex $F
		;;
esac


