
<!-- README.md is generated from README.Rmd. Please edit that file -->

# amexmetric

<!-- badges: start -->

[![R-CMD-check](https://github.com/igjit/amexmetric/workflows/R-CMD-check/badge.svg)](https://github.com/igjit/amexmetric/actions)
<!-- badges: end -->

An R implementation of the metric for the [Amex
competition](https://www.kaggle.com/competitions/amex-default-prediction).

## Installation

You can install the development version of amexmetric from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("igjit/amexmetric")
```

## Example

``` r
actual <- c(1, 1, 0, 0)
predicted <- c(0.9, 0.2, 0.8, 0)

amexmetric::amex_metric(actual, predicted)
#> [1] 0.2934783
```
