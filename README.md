
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fivestars

<!-- badges: start -->
<!-- [![CRAN status](https://img.shields.io/cran/v/fivestars?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=fivestars)  -->

[![Dev
status](https://img.shields.io/github/r-package/v/tanho63/fivestars/main?label=dev%20version&style=flat-square&logo=github)](https://fivestars.dynastyprocess.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/tanho63/fivestars/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/tanho63/fivestars/actions)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/tanho63/fivestars?label=codecov&style=flat-square&logo=codecov)](https://codecov.io/gh/tanho63/fivestars?branch=main)

<!-- badges: end -->

The goal of {fivestars} is to generate star ratings with HTML and CSS,
primarily for Shiny usage.

## Installation

Install the development version from GitHub with:

``` r
install.packages("fivestars", repos = "https://tanho63.r-universe.dev")

# or use remotes/devtools
# install.packages("remotes")
remotes::install_github("tanho63/fivestars")
```

## Usage

``` r
library(fivestars)
use_fivestars()
```

<style>:root {
  --star-size: larger;
  --star-background: #999;
  --star-color: #fc0;
}
        
.fivestars {
  --percent: calc(var(--rating)/5 * 100%);
  /* display: inline-block; */
  font-size: var(--star-size);
  line-height: 1;
}

.fivestars::before {
  content: '\2605\2605\2605\2605\2605';
  background: linear-gradient(90deg, var(--star-color) var(--percent), 
                              var(--star-background) var(--percent));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}</style>

``` r
fivestar(2.2)
```

<span class="fivestars" style="--rating: 2.2;" aria-label="The rating out of five stars is 2.2">2.2</span>
