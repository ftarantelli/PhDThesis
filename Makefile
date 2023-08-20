all: main_phdthesis.pdf
frn: main_phdthesis-frn.pdf

main_phdthesis.pdf: main_phdthesis.tex bib/ concs/ cpt/* imm/ intro/
	pdflatex main_phdthesis.tex; pdflatex main_phdthesis-frn.tex; bibtex main_phdthesis.aux; pdflatex main_phdthesis.tex; pdflatex main_phdthesis.tex
	make clear
	clear

main_phdthesis-frn.pdf: main_phdthesis.tex
	pdflatex main_phdthesis.tex; pdflatex main_phdthesis-frn.tex; pdflatex main_phdthesis.tex; pdflatex main_phdthesis.tex
	make clear
	#rm *frn.*

pdf:
	pdflatex main_phdthesis.tex
	clear

aux: 
	pdflatex main_phdthesis.tex; bibtex main_phdthesis.aux; pdflatex main_phdthesis.tex; pdflatex main_phdthesis.tex

show:
	$(alias_stdout) evince main_phdthesis.pdf &
	#export alias_stdout='bash ~/Desktop/stdout.sh'
main:
	vim main_phdthesis.tex

biblatex:
	vim bib/biblatex.cfg

ref:
	vim bib/refs.bib

sref:
	grep bib/refs.bib -e "$(word 2, $(MAKECMDGOALS))" -A 4 -B 6 

clear:
	find -name "main_phdthesis*" | grep -v "s.tex" | grep -v "s.pdf"| xargs rm
	find . | grep -e ".aux" -e ".bbl" -e ".blg" | xargs rm
