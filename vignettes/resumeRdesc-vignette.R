## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-")

## ---- echo = FALSE-------------------------------------------------------
"R CMD build --no-build-vignettes pkgname" 

## ------------------------------------------------------------------------
library(resumeRdesc)

