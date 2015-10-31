
CSS=pandoc.css

.PHONY: all pages

all: pages

pages: index.html greeknumeral.html

%.html: %.md $(CSS) Makefile
	pandoc --css=$(CSS) -o $@ $<
