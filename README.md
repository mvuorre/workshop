# brms workshop
Matti Vuorre

## Plan

We plan to tackle some or all of the topics below:

1.  [Collaboration and workflow](modules/workflow/index.qmd)
2.  [Multilevel models](modules/models/index.qmd): Priors, outcome
    distributions, and model comparison
3.  [Ordinal models](modules/ordinal/index.qmd)
4.  [Signal Detection Theoretic models](modules/sdt/index.qmd)
5.  [Censored models](modules/censored/index.qmd)

Our plan is to walk through (some of) them, and edit the code to address
your questions.

## Materials

The materials of this workshop are organized in
[Quarto](https://quarto.org/) files. The source code is on
[GitHub](https://github.com/mvuorre/workshop).

## Prerequisites

We assume some familiarity with basic statistical modeling and the R
language. If you’d like a refresher, see [Introduction to Modern
Statistics](https://openintro-ims.netlify.app/) & [R for Data
Science](https://r4ds.hadley.nz/). To follow along, you need to have

- R (<https://cran.r-project.org/>)
- An R IDE like [RStudio](https://posit.co/download/rstudio-desktop/)
  (recommended for beginners) or [Positron](https://positron.posit.co/)
  (advanced)
- [Quarto](https://quarto.org/) (for rendering the materials into a
  website)
- [Git](https://happygitwithr.com/install-git)
- A [GitHub account](https://happygitwithr.com/github-acct) (if you want
  to participate in live troubleshooting / contributing)

### Build / reproduce

Note that building the project will run all the analysis documents,
which involve bayesian models: This will take a long time. Because of
this, you should first create an `.Renviron` file to describe your
system settings (see `.Renviron.example`). For example,

``` bash
echo "
MAX_CORES = 8
BRMS_BACKEND = "cmdstanr"
BRMS_THREADS = 2
BRMS_ITER = 1000
" >> .Renviron
```

Then, to recreate the materials locally, run the following in your
terminal, *not* R (requires GNU Make). This will download the workshop
materials (all source code), and then run the required code.

``` bash
git clone https://github.com/mvuorre/workshop.git
cd brms-workshop.git
make
```

If you do not have Make installed (i.e. you are on Windows), you need to
execute the steps to build (or reproduce) manually

``` bash
# Restore R environment (packages)
R vanilla -e 'renv::restore(prompt = FALSE)'

# Prepare data
Rscript prepare-data.R

# Run everything and produce output documents (website in docs/)
quarto render
```

## Contribute

Issues & pull requests at <https://github.com/mvuorre/workshop> are
welcome.
