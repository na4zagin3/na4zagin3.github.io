
CSS=pandoc.css
BIB=ref.bib

.PHONY: all pages

all: pages

pages: index.html greeknumeral.html

%.html: %.md $(CSS) $(BIB) Makefile
	pandoc --bibliography=$(BIB) -s --css=$(CSS) -o $@ $<
