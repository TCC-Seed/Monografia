MAIN  = main
BUILD = build

LATEX     = pdflatex -shell-escape -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD)
BIBTEX    = bibtex
MAKEINDEX = makeindex

NOBLANK = \AtBeginDocument{\let\cleardoublepage\clearpage\ifdefined\openany\openany\fi}

PRINTING = \RequirePackage{etoolbox}\AtEndPreamble{\let\cleardoublepage\clearpage\ifdefined\openany\openany\fi\ifdefined\oneside\oneside\fi\ifdefined\setlrmarginsandblock\setlrmarginsandblock{3cm}{2cm}{*}\setulmarginsandblock{3cm}{2cm}{*}\checkandfixthelayout\fi\AtBeginDocument{\csname @twosidefalse\endcsname\csname @mparswitchfalse\endcsname\evensidemargin=\oddsidemargin}}

SOURCES = $(MAIN).tex $(shell find fixos editaveis -name '*.tex' 2>/dev/null)

.PHONY: all quick-web quick-printing clean cleanall

all: $(BUILD)/$(MAIN).pdf
	@cp $(BUILD)/$(MAIN).pdf ./$(MAIN).pdf
	@echo "PDF gerado: $(MAIN).pdf (e em $(BUILD)/$(MAIN).pdf)"

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/$(MAIN).pdf: $(SOURCES) bibliografia.bib | $(BUILD)
	$(LATEX) $(MAIN).tex
	-BIBINPUTS=.: $(BIBTEX) $(BUILD)/$(MAIN)
	-$(MAKEINDEX) $(BUILD)/$(MAIN).idx
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

quick-printing: | $(BUILD)
	$(LATEX) -jobname=$(MAIN) '$(NOBLANK)\input{$(MAIN).tex}'
	@cp $(BUILD)/$(MAIN).pdf ./$(MAIN).pdf
	@rm -f $(BUILD)/$(MAIN).pdf
	@echo "PDF gerado (rápido, sem páginas em branco): $(MAIN).pdf"

quick-web: | $(BUILD)
	$(LATEX) -jobname=$(MAIN) '$(PRINTING)\input{$(MAIN).tex}'
	@cp $(BUILD)/$(MAIN).pdf ./$(MAIN).pdf
	@rm -f $(BUILD)/$(MAIN).pdf
	@echo "PDF gerado (rápido, impressão: margens iguais em todas as páginas): $(MAIN).pdf"

clean:
	rm -rf $(BUILD)

cleanall: clean
	rm -f $(MAIN).pdf