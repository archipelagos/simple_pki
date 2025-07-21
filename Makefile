# INFO: Static extensions.
ADOC_EXT=					adoc
HTML_EXT=					html
PDF_EXT=					pdf

# INFO: Static directory names.
SRC_DIR_NAME=				src
BUILD_DIR_NAME=				build
DOC_DIR_NAME=				doc
HTML_DIR_NAME=				$(HTML_EXT)
PDF_DIR_NAME=				$(PDF_EXT)

# INFO: Dynamic directory paths.
SRC_DIR=					$(SRC_DIR_NAME)
BUILD_DIR=					$(BUILD_DIR_NAME)
BUILD_DOC_DIR=				$(BUILD_DIR_NAME)/$(DOC_DIR_NAME)
BUILD_DOC_HTML_DIR=			$(BUILD_DOC_DIR)/$(HTML_DIR_NAME)
BUILD_DOC_PDF_DIR=			$(BUILD_DOC_DIR)/$(PDF_DIR_NAME)

# INFO: List of directories created dynamicly.
DIRS_TO_BE_CREATED_LIST= 	$(BUILD_DOC_HTML_DIR) \
							$(BUILD_DOC_PDF_DIR)
# INFO: Sources.
ADOC_ROOT_SRC=				$(SRC_DIR)/README.$(ADOC_EXT)

# INFO: Outputs.
ADOC_OUTPUT_HTML=$(patsubst \
					$(SRC_DIR)/%.$(ADOC_EXT), \
					$(BUILD_DOC_HTML_DIR)/%.$(HTML_EXT), \
					$(ADOC_ROOT_SRC))

# INFO: Outputs.
ADOC_OUTPUT_PDF=$(patsubst \
					$(SRC_DIR)/%.$(ADOC_EXT), \
					$(BUILD_DOC_PDF_DIR)/%.$(PDF_EXT), \
					$(ADOC_ROOT_SRC))

# INFO: Uber build command.
all: \
	$(ADOC_OUTPUT_HTML) \
	$(ADOC_OUTPUT_PDF)

# INFO: Uber clean command.
clean:
	rm \
		-rf \
		$(BUILD_DIR)

# INFO: HTML output.
$(ADOC_OUTPUT_HTML): \
		$(BUILD_DOC_HTML_DIR)/%.$(HTML_EXT): \
		$(SRC_DIR)/%.$(ADOC_EXT) | \
		$(BUILD_DOC_HTML_DIR)
	asciidoctor \
		$< \
		-o \
		$@

# INFO: PDF output.
$(ADOC_OUTPUT_PDF): \
		$(BUILD_DOC_PDF_DIR)/%.$(PDF_EXT): \
		$(SRC_DIR)/%.$(ADOC_EXT) | \
		$(BUILD_DOC_PDF_DIR)
	asciidoctor-pdf \
		$< \
		-o \
		$@

# INFO: List of directories created dynamicly.
$(DIRS_TO_BE_CREATED_LIST): \
		%:
	mkdir \
		-p \
		$*