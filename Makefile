# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis
TIDY-HTML5 = tidy-html5

all: tidy index.html ../xref/xrefs/dom/presentation.json

index.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --w3c-status=ED --w3c-compat-substitutions \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--xref="../xref" --enable=refs $< $@

../xref/xrefs/dom/presentation.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

tidy: Overview.src.html build/tidyconfig.txt
	$(TIDY-HTML5) -config build/tidyconfig.txt -o $< $<
