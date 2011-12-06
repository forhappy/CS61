all:CS61-class-11.pdf 

CS61-class-11.pdf:CS61-class-11.tex 
	pdflatex $^
	pdflatex $(shell pwd)/*.tex  $(shell pwd)/*.toc $(shell pwd)/*.aux 
	evince $@

.PHONY:clean
clean:
	rm *.log *.aux *.out *.toc *.pdf
