# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'blog'
copyright = '2026, hongyang'
author = 'hongyang'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.intersphinx',
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
]

templates_path = ['_templates']
exclude_patterns = []

# -- Internationalization (i18n) settings ------------------------------------
import os

# Default language is Chinese (your source language)
# Read language from RTD environment variable if available
language = os.environ.get('READTHEDOCS_LANGUAGE', 'zh_CN')

# Available languages for translation
locale_dirs = ['locale/']   # path is relative to source directory
gettext_compact = False     # optional, to keep directory structure



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

html_css_files = [
    'css/custom.css',
]

html_js_files = [
    'js/language_switcher.js',
]
