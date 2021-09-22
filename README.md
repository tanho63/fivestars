
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fivestars ⭐⭐⭐⭐⭐

<!-- badges: start -->
<!-- [![CRAN status](https://img.shields.io/cran/v/fivestars?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=fivestars)  -->

[![Dev
status](https://img.shields.io/github/r-package/v/tanho63/fivestars/main?label=dev%20version&style=flat-square&logo=github)](https://fivestars.dynastyprocess.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- [![R build status](https://img.shields.io/github/workflow/status/tanho63/fivestars/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/tanho63/fivestars/actions) -->
<!-- [![Codecov test coverage](https://img.shields.io/codecov/c/github/tanho63/fivestars?label=codecov&style=flat-square&logo=codecov)](https://codecov.io/gh/tanho63/fivestars?branch=main) -->

<!-- badges: end -->

The goal of {fivestars} is to generate star ratings with HTML and CSS.

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
```

`use_fivestars()` adds the appropriate CSS and allows for some
configuration of defaults (star size, colour, and background).

``` r
use_fivestars(
  star_size = "20px", # default is "larger"
  star_color = "#fc0", # default
  star_background = "#999" # default
)
```
```
<style>:root {
  --star-size: 20px;
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
```
Minimal usage of the `fivestar` function looks like this:

``` r
fivestars(rating = 3.5)
```
```
<div>
3.5
<span class="fivestars" style="--rating: 3.5;" aria-label="The rating is 3.5 out of five stars"></span>
</div>
```
<br> The output can be further customized with some arguments, e.g.

``` r
fivestars(rating = 1.2,
         label = "Poor",
         label_pos = "right",
         aria_label = "This item is rated 'Poor'",
         star_color = "#d13", 
         star_background = "#000")
```
```
<div>
<span class="fivestars" style="--rating: 1.2; --star-color: #d13; --star-background: #000;" aria-label="This item is rated &#39;Poor&#39;"></span>
Poor
</div>
```
