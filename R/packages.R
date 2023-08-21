##' Install packages at once
##'
##' @param packages A string vector specifying packages
##' @export
install_packages <- function(packages) {
  if (missing(packages))
    packages <- c(
      "adabag", "arules", "arulesViz", "bayesplot", "benchmarkme", "bestglm"
    , "Boruta", "brms", "bslib", "calendR", "car", "caret", "caretEnsemble", "caTools"
    , "chemometrics", "circlize", "cluster", "compareGroups", "corrplot"
    , "data.table", "DBI", "devtools", "DiagrammeR", "dplyr", "DT", "dygraphs"
    , "e1071", "earth", "epiR", "extrafont", "faraway", "fastAdaboost", "feather"
    , "forcats", "forecast", "foreign", "formattable", "fortunes", "gamlss", "gbm"
    , "genridge", "ggalluvial", "gganimate", "ggbump", "ggdark", "ggExtra", "ggfortify"
    , "ggmap", "ggnetwork", "ggparliament", "ggplot2", "ggridges", "ggstream"
    , "ggthemes", "ggVennDiagram", "ggvoronoi", "ggwordcloud", "glmnet", "gridExtra", "gvlma"
    , "haven", "highcharter", "Hmisc", "htmlwidgets"
    , "imager", "installr", "investr", "ISLR", "jsonlite"
    , "keras", "kernlab", "kknn", "KMsurv"
    , "leaflet", "leaps", "lightgbm", "lmtest", "lubridate"
    , "maps", "metricsgraphics", "mice", "microbenchmark", "missForest"
    , "mlbench", "mlr", "MPV", "multilevel", "multilinguer"
    , "NbClust", "networkD3", "neuralnet"
    , "odbc", "openssl", "openxlsx"
    , "party", "partykit", "plotly", "pls", "pROC", "profvis", "proto", "pryr"
    , "pscl", "psych", "purrr"
    , "qdap", "quanteda", "quantmod", "quantreg"
    , "randomForest", "rattle", "RColorBrewer", "Rcpp", "RcppArmadillo", "RcppEigen"
    , "RcppParallel", "RCurl", "readr", "readxl", "recommenderlab", "reticulate"
    , "Rfast", "rgl", "rglwidget", "ridge", "rintrojs", "rio", "rJava", "rlang"
    , "rmarkdown", "RMySQL", "ROCR", "RODBC", "roxygen2", "rpart", "rpart.plot"
    , "RSQLite", "rstudioapi", "sampling", "scales", "scatterplot3d", "segmented"
    , "shiny", "shinyBS", "shinycssloaders", "shinydashboard", "shinyjs", "shinymanager"
    , "shinyWidgets", "showtext", "slickR", "snpsettest", "sparcl", "statmod"
    , "stplanr", "stringi", "stringr", "survival", "survminer"
    , "tensorflow", "testthat", "textclean", "tibble", "tidybayes", "tidymodels"
    , "tidyr", "tidytext", "tm", "topicmodels", "TraMineR", "treemap", "truncreg"
    , "tseries", "tweedie", "utf8", "vars", "vcd", "VGAM", "VIM", "wordcloud"
    , "xgboost", "xlsx", "XML", "xtable"
    )
  avbl_pkgs <- data.table::data.table(utils::available.packages())
  packages <- avbl_pkgs[avbl_pkgs$Package %in% packages, ]$Package
  dependencies <- tools::package_dependencies(packages, db = avbl_pkgs, recursive = TRUE)
  pkgs_db <- data.table::data.table(cbind(dependencies), keep.rownames = "package")
  pkgs_list <- sort(unique(c(pkgs_db$package, unlist(pkgs_db$dependencies))))
  pkgs_add <- rownames(installed.packages())
  pkgs_list <- pkgs_list[!pkgs_list %in% pkgs_add]

  while (length(pkgs_list) > 0) {
    cat(sprintf("\n%d package(s) left.\n", length(pkgs_list)))
    pkg <- pkgs_list[1L]
    if (Sys.info()["sysname"] == "Linux") {
      if (!requireNamespace(pkg, quietly = T)) install.packages(pkg)
    } else {
      if (!requireNamespace(pkg, quietly = T)) install.packages(pkg, type = "binary")
    }
    pkgs_add <- rownames(installed.packages())
    pkgs_list <- pkgs_list[!pkgs_list %in% pkgs_add]
    if (length(pkgs_list) > 1 & pkgs_list[1L] == pkg)
      stop("Installing '", pkg, "' is failed.")
  }
  devtools::install_github("seokhoonj/ecos")
  devtools::install_github("seokhoonj/kosis")
  devtools::install_github("seokhoonj/papagor")
  devtools::install_github("seokhoonj/navergmail")
  devtools::install_github("seokhoonj/vuw")
}

##' @rdname install_packages
##' @export
install_project_packages <- function() {
  project_packages <- c(
    "bslib"
  , "data.table"
  , "devtools"
  , "epiR"
  , "ggplot2"
  , "grid"
  , "gridExtra"
  , "igraph"
  , "keras"
  , "lightgbm"
  , "openxlsx"
  , "plotly"
  , "randomForest"
  , "readxl"
  , "reticulate"
  , "rintrojs"
  , "scales"
  , "shiny"
  , "shinyBS"
  , "shinycssloaders"
  , "shinydashboard"
  , "shinyjs"
  , "shinyWidgets"
  , "statmod"
  , "stringr"
  , "tensorflow"
  , "tibble"
  , "tidyverse"
  , "tweedie"
  , "usethis"
  , "visNetwork"
  , "xgboost"
  )
  install_packages(project_packages)
}
