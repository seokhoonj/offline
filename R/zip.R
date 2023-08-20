##' Create zip archive
##'
##' utils::zip with some default values
##'
##' @details
##' \itemize{
##'   \item -r  recurse into directories
##'   \item -0  store only
##'   \item -1  compress faster
##'   \item -9  compress better
##'   \item -X  eXclude eXtra file attributes
##'   \item -q  quiet operation
##'   \item -s  split size
##' }
##'
##' @param files A string of a filename
##' @param flags A string of flags to be passed to the command
##' @param split_size A numeric value of split size (Megabyte)
##' @export
zip_files <- function(files, flags = "-r9X", split_size) {
  zipfile <- sprintf("%s.zip", tools::file_path_sans_ext(basename(files)))
  if (!missing(split_size))
     flags <- paste(flags, sprintf("-s %dm", split_size))
  utils::zip(zipfile = zipfile, files = files, flags = flags)
}

##' Create installed R packages zip archive
##'
##' @details
##' \itemize{
##'   \item -r  recurse into directories
##'   \item -0  store only
##'   \item -1  compress faster
##'   \item -9  compress better
##'   \item -X  eXclude eXtra file attributes
##'   \item -q  quiet operation
##'   \item -s  split size
##' }
##'
##' @param flags A string of flags to be passed to the command
##' @param split_size A numeric value of split size (Megabyte)
##' @export
zip_r_packages <- function(flags = "-r9X", split_size) {
  path <- .libPaths()[1L]
  zipfile <- sprintf("%s.zip", tools::file_path_sans_ext(basename(files)))
  if (!missing(split_size))
     flags <- paste(flags, sprintf("-s %dm", split_size))
  utils::zip(zipfile = zipfile, files = path, flags = flags)
}
