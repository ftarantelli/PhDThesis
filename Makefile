all: main_phdthesis.pdf
frn: main_phdthesis-frn.pdf

main_phdthesis.pdf: main_phdthesis.tex bib/ concs/ cpt/ imm/ intro/
	pdflatex main_phdthesis.tex; pdflatex main_phdthesis-frn.tex; bibtex main_phdthesis.aux; pdflatex main_phdthesis.tex; pdflatex main_phdthesis.tex
	make clear

main_phdthesis-frn.pdf: main_phdthesis.tex
	pdflatex main_phdthesis.tex; pdflatex main_phdthesis-frn.tex; pdflatex main_phdthesis.tex; pdflatex main_phdthesis.tex
	make clear
	#rm *frn.*

show:
	evince main_phdthesis.pdf &

main:
	vim main_phdthesis.tex

biblatex:
	vim bib/biblatex.cfg

ref:
	vim bib/refs.bib

clear:
	find -name "main_phdthesis*" | grep -v "s.tex" | grep -v "s.pdf"| xargs rm
	find . | grep -e ".aux" -e ".bbl" -e ".blg" | xargs rm
