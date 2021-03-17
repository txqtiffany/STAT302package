# STAT302package

<!-- badges: start -->
[![R-CMD-check](https://github.com/txqtiffany/STAT302package/workflows/R-CMD-check/badge.svg)](https://github.com/txqtiffany/STAT302package/actions)
<!-- badges: end -->

The goal of STAT302package is a demonstration on my learning of developing a well-documented, well-tested, and well-explained R package from the course of STAT 302. 

## Installation

You can install the STAT302package using the following line:

``` r
devtools::install_github("txqtiffany/STAT302package", build_vignette = TRUE, build_opts = c())
library(STAT302package)
```

## Use

The vignette demonstrates example usage of all main functions. You can see the vignette by using the following code:

``` r
library(STAT302package)
# Use this to view the vignette in the corncob HTML help
help(package = "STAT302package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "STAT302package")
```

