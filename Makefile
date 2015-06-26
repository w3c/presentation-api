# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis
TIDY-HTML5 = tidy-html5

# This hacky set of shell commands should return the URL of the latest
# version of the spec published in /TR/ space. This URL is used to compute the
# "Previous version" link automatically.
# TODO: Rather use the "Web API" that W3C will soon expose once it is available
PUBLISHED-URL=$(shell curl -s http://www.w3.org/TR/presentation-api/ \
	| grep "This version" --after-context=6 \
	| grep "<a href" \
	| sed "s/^.*<a href=\"//" \
	| sed "s/\".*//")


# Default rule generates the Editor's Draft
all: index.html

# Rule to generate the First Public Working Draft
fpwd: releases/FPWD.html

# Rule to generate a new Working Draft release
wd: releases/WD.html


releases/FPWD.html: tidy ../xref xrefs/presentation.json
	$(ANOLIS) --w3c-status=WD --w3c-compat-substitutions \
	--w3c-compat-crazy-substitutions --w3c-shortname="presentation-api" \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--xref="../xref" --enable=refs Overview.src.html $@


releases/WD.html: tidy ../xref xrefs/presentation.json
	# Generate the Working Draft release from the source spec
	# (in a temp file as "previous link" will not yet be correct)
	$(ANOLIS) --w3c-status=WD --w3c-compat-substitutions \
	--w3c-compat-crazy-substitutions --w3c-shortname="presentation-api" \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--xref="../xref" --enable=refs Overview.src.html tmp.html

	# Generate the "Previous version" link and the final Working Draft
	sed "s|<!--previous-version-->|\
	<dt>Previous version:</dt><dd><a href=\"$(PUBLISHED-URL)\">$(PUBLISHED-URL)</a></dd>|" tmp.html > $@

	# Get rid of the temp copy
	rm tmp.html


index.html: tidy ../xref xrefs/presentation.json
	# Make a temp copy of the source spec, replacing [VERSION] used in the
	# "This version" link with the right GitHub page address
	# (Anolis would generate a URL in /TR/ space otherwise, which is good
	# for Working Draft releases but not for Editor's Drafts)
	sed "s|\[VERSION\]|http://w3c.github.io/presentation-api/|" \
		Overview.src.html > tmp.html

	# Generate the Editor's Draft from the temp copy
	$(ANOLIS) --w3c-status=ED --w3c-compat-substitutions \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--xref="../xref" --enable=refs tmp.html $@

	# Get rid of the temp copy
	rm tmp.html


xrefs/presentation.json: Overview.src.html
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec


tidy: Overview.src.html build/tidyconfig.txt
	$(TIDY-HTML5) -config build/tidyconfig.txt -o $< $<
