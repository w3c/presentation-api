# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis
TIDY-HTML5 = tidy-html5

all: tidy releases/FPWD.html xrefs/presentation.json

releases/FPWD.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --w3c-status=WD --w3c-compat-substitutions \
	--w3c-compat-crazy-substitutions --w3c-shortname="presentation-api" \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--xref="../xref" --enable=refs $< $@

xrefs/presentation.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

tidy: Overview.src.html build/tidyconfig.txt
	$(TIDY-HTML5) -config build/tidyconfig.txt -o $< $<
