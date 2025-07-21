ADOC_EXT=adoc
HTML_EXT=html

ADOC_ROOT_SRC=README.$(ADOC_EXT)

ADOC_OUTPUT_HTML=$(patsubst %.$(ADOC_EXT), %.$(HTML_EXT), $(ADOC_ROOT_SRC))

all: \
	$(ADOC_OUTPUT_HTML)

clean:
	rm -f example.png

# INFO: HTML output.
$(ADOC_OUTPUT_HTML): \
		%.$(HTML_EXT): \
		%.$(ADOC_EXT)
	echo asciidoctor $<