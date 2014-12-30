# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis
TIDY-HTML5 = tidy-html5

all: tidy index.html

# TODO: Re-enable xrefs when there are refs.
index.html: Overview.src.html Makefile
	$(ANOLIS) --w3c-status=ED --w3c-compat-substitutions \
	--omit-optional-tags --quote-attr-values --disable=xspecxref \
	--disable=refs $< $@

# TODO: Re-enable when there are refs.
#xrefs/specs.json: Overview.src.html Makefile
#	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

tidy: Overview.src.html build/tidyconfig.txt
	$(TIDY-HTML5) -config build/tidyconfig.txt -o $< $<
