##' Get links of tool list for offline projects
##'
##' @export
get_project_tools <- function() {
  tool_list = list(
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
