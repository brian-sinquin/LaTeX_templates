# Makefile for LaTeX Template Project
# Modern pipeline: pdflatex + biber + latexmk
# Usage:
#   make          — build all CVs (default)
#   make cv       — build CV/main.pdf
#   make postdoc-en — build CV_postdoc/EN/main.pdf
#   make postdoc-fr — build CV_postdoc/FR/main.pdf
#   make clean    — remove all build artifacts
#
# For XeLaTeX/LuaLaTeX (with academicons and OpenType fonts):
#   make engine=xelatex cv     or   make engine=lualatex cv

ENGINE ?= pdflatex
LATEXMK = latexmk
LATEXMK_FLAGS = -$(ENGINE) -silent -bibtex-cond1 -use-make

# Default target: all CVs
all: cv postdoc-en postdoc-fr

# Individual CV targets
cv:
	cd CV && $(LATEXMK) $(LATEXMK_FLAGS) main.tex

postdoc-en:
	cd CV_postdoc/EN && $(LATEXMK) $(LATEXMK_FLAGS) main.tex

postdoc-fr:
	cd CV_postdoc/FR && $(LATEXMK) $(LATEXMK_FLAGS) main.tex

# Clean build artifacts
clean:
	cd CV && $(LATEXMK) -C main.tex 2>/dev/null || true
	cd CV_postdoc/EN && $(LATEXMK) -C main.tex 2>/dev/null || true
	cd CV_postdoc/FR && $(LATEXMK) -C main.tex 2>/dev/null || true
	rm -f CV/*.bbl CV/*.blg CV/*.run.xml CV/*.bcf
	rm -f CV_postdoc/EN/*.bbl CV_postdoc/EN/*.blg CV_postdoc/EN/*.run.xml CV_postdoc/EN/*.bcf
	rm -f CV_postdoc/FR/*.bbl CV_postdoc/FR/*.blg CV_postdoc/FR/*.run.xml CV_postdoc/FR/*.bcf

# Dist-clean: remove PDFs too
distclean: clean
	rm -f CV/main.pdf CV_postdoc/EN/main.pdf CV_postdoc/FR/main.pdf

.PHONY: all cv postdoc-en postdoc-fr clean distclean