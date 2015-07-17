tidy: index.html build/tidyconfig.txt
	tidy-html5 -config build/tidyconfig.txt -o $< $<