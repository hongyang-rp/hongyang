# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile gettext

# i18n targets for translation workflow
gettext:
	@$(SPHINXBUILD) -b gettext $(SOURCEDIR) $(SOURCEDIR)/locale/pot
	@echo "POT files generated in $(SOURCEDIR)/locale/pot"

# Initialize English translation (run once)
init-en:
	sphinx-intl update -p $(SOURCEDIR)/locale/pot -l en

# Update English translation files after source changes
update-en:
	@$(SPHINXBUILD) -b gettext $(SOURCEDIR) $(SOURCEDIR)/locale/pot
	sphinx-intl update -p $(SOURCEDIR)/locale/pot -l en
	@echo "English PO files updated in $(SOURCEDIR)/locale/en/LC_MESSAGES/"

# Build Chinese version (default)
html-zh:
	@$(SPHINXBUILD) -b html -D language=zh_CN $(SOURCEDIR) $(BUILDDIR)/html/zh_CN $(SPHINXOPTS) $(O)
	@echo "Chinese HTML build finished. The HTML pages are in $(BUILDDIR)/html/zh_CN"

# Build English version
html-en:
	@$(SPHINXBUILD) -b html -D language=en $(SOURCEDIR) $(BUILDDIR)/html/en $(SPHINXOPTS) $(O)
	@echo "English HTML build finished. The HTML pages are in $(BUILDDIR)/html/en"

# Build both languages
html-all: html-zh html-en
	@echo "Both Chinese and English versions built successfully!"

.PHONY: help Makefile gettext init-en update-en html-zh html-en html-all

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
