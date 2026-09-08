MAIN  = main
BUILD = build

LATEX     = pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD)
BIBTEX    = bibtex
MAKEINDEX = makeindex

SOURCES = $(MAIN).tex $(shell find fixos editaveis -name '*.tex' 2>/dev/null)

.PHONY: all clean cleanall

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

clean:
	rm -rf $(BUILD)

cleanall: clean
	rm -f $(MAIN).pdf