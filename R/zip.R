##' Create zip archive
##'
##' @description
##' utils::zip with some default values
##'
##' @param files A string of a filename
##' @param flags A string of flags to be passed to the command
##' @param split_size A numeric value of split size (Megabyte)
##' @export
zip_files <- function(files, flags = "-r9X", split_size) {
  zipfile <- sprintf("%s.zip", files)
  if (!missing(split_size))
     flags <- paste(flags, sprintf("-s %dm", split_size))
  utils::zip(zipfile = zipfile, files = files, flags = flags)
}

##' Create installed R packages zip archive
##'
##' @details
##' -r  recurse into directories
##' -0  store only
##' -1  compress faster
##' -9  compress better
##' -X  eXclude eXtra file attributes
##' -q  quiet operation
##' -s  split size
##' @param flags A string of flags to be passed to the command
##' @param split_size A numeric value of split size (Megabyte)
##' @export
zip_r_packages <- function(flags = "-r9X", split_size) {
  path <- .libPaths()[1L]
  zipfile <- sprintf("%s.zip", basename(path))
  if (!missing(split_size))
     flags <- paste(flags, sprintf("-s %dm", split_size))
  utils::zip(zipfile = zipfile, files = path, flags = flags)
}
