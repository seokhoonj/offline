
# offline

<!-- badges: start -->
[![R-CMD-check](https://github.com/seokhoonj/offline/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/seokhoonj/offline/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Installation

``` r
# install dev version
devtools::install_github("seokhoonj/offline")
```

## Example

``` r
library(offline)

get_project_tools() # links of R, Rtools, RStudio etc 
zip_file("~/Downloads/R-4.3.1-win.exe")
zip_file("~/Downloads/Rtools43-5550-5548.exe")
zip_file("~/Downloads/RStudio-2023.06.1-524.exe")
install_project_packages() # install packages you want
zip_r_packages()
# or consider client mail system capability (Megabyte)
zip_r_packages(split_size = 100) 
```
