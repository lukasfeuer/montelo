#' MMM Template
#'
#' Generates a .R-file with the basic code structure and dependencies for MMM.
#' 
#' Default library for model functions is montelo
#'
#' @param path string, optional path to save the file to, default is current wd
#' @param filename string for the file name e.g. "myModelFile" - no file extension
#'
#' @return Generates a .R-file with a template for MMM-Modeling
#' @export
#'
#' 
mmm_template <- function(path = NULL, filename = "mmm_template") {
  
  if (!is.null(path)) {
    setwd(path)
    }
  
  fileConn<-file(paste0(filename, ".R"))
  writeLines(c(
"#===============================================================================:
# Model | Project ----
#===============================================================================:

# Sigmoid function - often used for classification             
sigmoid1 <- function(w, x, b) {
  1 / (1 + exp((-w * x) + b))
}


"), fileConn)
  close(fileConn)
}
