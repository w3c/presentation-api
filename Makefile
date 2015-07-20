TIDY-HTML5 ?= tidy-html5

tidy: index.html build/tidyconfig.txt
	$(TIDY-HTML5) -config build/tidyconfig.txt -o $< $<