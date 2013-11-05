# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis

all: index.html ../xref/xrefs/dom/presentation.json

index.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --w3c-compat-substitutions \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--xref="../xref" --enable=refs $< $@

../xref/xrefs/dom/presentation.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
