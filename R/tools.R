##' Links of tools for offline projects
##'
##' @export
link_tools <- function() {
  tool_list <- list(
    "Download R" = "https://cran.r-project.org/bin/windows/base/",
    "Download Rtools" = "https://cran.r-project.org/bin/windows/Rtools/",
    "Download RStudio" = "https://posit.co/download/rstudio-desktop/",
    "Download Anaconda" = "https://www.anaconda.com/download#downloads",
    "Download VSCode" = "https://code.visualstudio.com/docs/?dv=win64user",
    "VSCodeVim" = "https://marketplace.visualstudio.com/items?itemName=vscodevim.vim"
  )
  for (i in seq_along(tool_list)) {
    cat(cli::style_hyperlink(
      text = names(tool_list)[i],
      url = tool_list[i]
    ), "\n")
  }
}

##' Download tools for offline projects
##'
##' @param tools A string vector specifying tools
##' @export
download_tools <- function(tools = c("R", "Rtools", "RStudio")) {
  tool_list <- list(
    R = "https://cran.r-project.org/bin/windows/base/R-4.3.1-win.exe",
    Rtools = "https://cran.r-project.org/bin/windows/Rtools/rtools43/files/rtools43-5550-5548.exe",
    RStudio = "https://download1.rstudio.org/electron/windows/RStudio-2023.06.1-524.exe"
  )
  op <- options(timeout = 300)
  on.exit(options(op))
  invisible(lapply(
    tool_list[names(tool_list) %in% tools],
    function(x) utils::download.file(x, basename(x))
  ))
}
