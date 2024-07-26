# K souboru: proj3.tex
# Datum:    03.04.2024
# Autor:    Petr Vitula (xvitulp00@fit.vutbr.cz)
# Projekt:  ITY projekt 3

PROJ=proj3
PACK=xvitulp00-fit

.PHONY: clean pack pdflatex

$(PROJ).pdf: $(PROJ).ps
	ps2pdf $(PROJ).ps

$(PROJ).ps: $(PROJ).dvi
	dvips -t a4 $(PROJ).dvi

$(PROJ).dvi: $(PROJ).tex
	latex $(PROJ).tex
	latex $(PROJ).tex

$(PACK).tar.gz: $(PROJ).tex
	tar -czf $(PACK).tar.gz Makefile $(PROJ).tex

pdflatex: $(PROJ).tex
	pdflatex $(PROJ).tex

pack: $(PACK).tar.gz

clean:
	rm -f $(PROJ).aux $(PROJ).dvi $(PROJ).log $(PROJ).ps $(PROJ).synctex.gz $(PROJ).fls $(PROJ).fdb_latexmk
