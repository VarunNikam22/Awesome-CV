.PHONY: cv clean clean-aux

CC = latexmk -interaction=nonstopmode -file-line-error -xelatex
CV_DIR = varun
CV_SRCS = $(shell find $(CV_DIR)/cv -name '*.tex')

cv: pdf clean-aux

pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CV_DIR) $<

clean-aux:
	find $(CV_DIR) -maxdepth 1 -type f \( -name '*.aux' -o -name '*.log' -o -name '*.xdv' -o -name '*.out' -o -name '*.toc' -o -name '*.lof' -o -name '*.lot' -o -name '*.fls' -o -name '*.fdb_latexmk' -o -name '*.synctex.gz' -o -name '*.bbl' -o -name '*.blg' \) -delete

clean:
	rm -rf $(CV_DIR)/*.pdf