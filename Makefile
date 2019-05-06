
CSS=pandoc.css
BIB=ref.bib

.PHONY: all pages

all: pages

pages: index.html greeknumeral.html

greeknumeral.html: PANDOC_OPTS=--mathjax --toc --toc-depth=2

%.html: %.md $(CSS) $(BIB) Makefile
	pandoc --bibliography=$(BIB) -s --css=$(CSS) -o $@ $(PANDOC_OPTS) $<
