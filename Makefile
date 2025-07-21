# INFO: Static extensions.
ADOC_EXT=					adoc
HTML_EXT=					html

# INFO: Static directory names.
SRC_DIR_NAME=				src
BUILD_DIR_NAME=				build
DOC_DIR_NAME=				doc
HTML_DIR_NAME=				html

# INFO: Dynamic directory paths.
SRC_DIR=					$(SRC_DIR_NAME)
BUILD_DIR=					$(BUILD_DIR_NAME)
BUILD_DOC_DIR=				$(BUILD_DIR_NAME)/$(DOC_DIR_NAME)
BUILD_DOC_HTML_DIR=			$(BUILD_DOC_DIR)/$(HTML_DIR_NAME)

# INFO: List of directories created dynamicly.
DIRS_TO_BE_CREATED_LIST= 	$(BUILD_DOC_HTML_DIR)

# INFO: Sources.
ADOC_ROOT_SRC=				$(SRC_DIR)/README.$(ADOC_EXT)

# INFO: Outputs.
ADOC_OUTPUT_HTML=$(patsubst \
					$(SRC_DIR)/%.$(ADOC_EXT), \
					$(BUILD_DOC_HTML_DIR)/%.$(HTML_EXT), \
					$(ADOC_ROOT_SRC))

# INFO: Uber build command.
all: \
	$(ADOC_OUTPUT_HTML)

# INFO: Uber clean command.
clean:
	rm \
		-rf \
		$(BUILD_DIR)

# INFO: HTML doc output.
#$(ADOC_OUTPUT_HTML): \
#		$(BUILD_DOC_HTML_DIR)/%.$(HTML_EXT): \
#		$(SRC_DIR)/%.$(ADOC_EXT) | \
#		$(BUILD_DOC_HTML_DIR)
#	echo star: $*

$(ADOC_OUTPUT_HTML): \
		$(BUILD_DOC_HTML_DIR)/%.$(HTML_EXT): \
		$(SRC_DIR)/%.$(ADOC_EXT) | \
		$(BUILD_DOC_HTML_DIR)
	asciidoctor \
		$< \
		-o \
		$@

# INFO: List of directories created dynamicly.
$(DIRS_TO_BE_CREATED_LIST): \
		%:
	mkdir \
		-p \
		$*