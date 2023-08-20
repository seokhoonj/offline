
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

# check webpages of tools (links of R, Rtools, RStudio etc)
link_tools()

# download tools (R, Rtools, RStudio)
download_tools()

# for exe files
# zip_files("R-4.3.1-win.exe")
# zip_files("Rtools43-5550-5548.exe")
# zip_files("RStudio-2023.06.1-524.exe")
invisible(sapply(dir(pattern = ".exe"), zip_files))

# zip r packages
install_project_packages() # install packages you want
zip_r_packages()

# or consider client mail system capability (Megabyte)
# zip_r_packages(split_size = 100) 
```
