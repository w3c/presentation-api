TIDY ?= tidy-html5

tidy: index.html build/tidyconfig.txt
	$(TIDY) -ashtml -config build/tidyconfig.txt -o $< $<
