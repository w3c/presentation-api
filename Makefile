TIDY ?= tidy-html5

tidy: index.html build/tidyconfig.txt
	$(TIDY) -config build/tidyconfig.txt -o $< $<
