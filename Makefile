# Makefile for LaTeX Template Project
# Local pipeline: pdflatex + bibtex (no latexmk needed)
# Usage:
#   make          — build all CVs (default)
#   make cv       — build CV/main.pdf
#   make postdoc-en — build CV_postdoc/EN/main.pdf
#   make postdoc-fr — build CV_postdoc/FR/main.pdf
#   make clean    — remove all build artifacts
#
# For XeLaTeX/LuaLaTeX (with academicons and OpenType fonts),
# the CI uses dante-ev/latex-action with latexmk.
# Locally, run pdflatex/bibtex manually.

PDFLATEX = pdflatex -interaction=nonstopmode -halt-on-error
BIBTEX = bibtex

# Default target: all CVs
all: cv postdoc-en postdoc-fr

# Individual CV targets
cv:
	cd CV && $(PDFLATEX) main.tex && $(BIBTEX) main && $(PDFLATEX) main.tex && $(PDFLATEX) main.tex

postdoc-en:
	cd CV_postdoc/EN && $(PDFLATEX) main.tex && $(BIBTEX) main && $(PDFLATEX) main.tex && $(PDFLATEX) main.tex

postdoc-fr:
	cd CV_postdoc/FR && $(PDFLATEX) main.tex && $(BIBTEX) main && $(PDFLATEX) main.tex && $(PDFLATEX) main.tex

# Clean build artifacts
clean:
	rm -f CV/*.aux CV/*.log CV/*.out CV/*.toc CV/*.nav CV/*.snm
	rm -f CV/*.bbl CV/*.blg CV/*.run.xml CV/*.bcf CV/*-blx.bib
	rm -f CV/*.fdb_latexmk CV/*.fls CV/*.synctex* CV/*.dvi CV/*.pdf
	rm -f CV_postdoc/EN/*.aux CV_postdoc/EN/*.log CV_postdoc/EN/*.out CV_postdoc/EN/*.toc
	rm -f CV_postdoc/EN/*.bbl CV_postdoc/EN/*.blg CV_postdoc/EN/*.run.xml CV_postdoc/EN/*.bcf CV_postdoc/EN/*-blx.bib
	rm -f CV_postdoc/EN/*.fdb_latexmk CV_postdoc/EN/*.fls CV_postdoc/EN/*.synctex* CV_postdoc/EN/*.dvi CV_postdoc/EN/*.pdf
	rm -f CV_postdoc/FR/*.aux CV_postdoc/FR/*.log CV_postdoc/FR/*.out CV_postdoc/FR/*.toc
	rm -f CV_postdoc/FR/*.bbl CV_postdoc/FR/*.blg CV_postdoc/FR/*.run.xml CV_postdoc/FR/*.bcf CV_postdoc/FR/*-blx.bib
	rm -f CV_postdoc/FR/*.fdb_latexmk CV_postdoc/FR/*.fls CV_postdoc/FR/*.synctex* CV_postdoc/FR/*.dvi CV_postdoc/FR/*.pdf

# Dist-clean: remove PDFs too
distclean: clean
	# Already done in clean

.PHONY: all cv postdoc-en postdoc-fr clean distclean