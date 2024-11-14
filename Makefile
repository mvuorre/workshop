all: renv data readme render

renv: renv.lock
	R -e 'renv::restore(prompt = FALSE)'

data: renv prepare-data.R
	Rscript prepare-data.R

readme: index.qmd
	quarto render index.qmd --to gfm --output README.md --output-dir .

render: 
	quarto render

.PHONY: all render renv
