#' Append Season Model
#'
#' Helper for find_season()
#'
#' @param model model object
#' @param var string
#' @param data data frame
#'
#' @return
#' @export
#'
#'
append_season_model <- function(model = model, var = var, data = data) {

  ModelTerms <- paste(attr(model[["terms"]],"term.labels"), collapse = " + ")

  ModelTerms <- paste(ModelTerms, var, sep = " + ")

  NewFormula <- paste(model[["terms"]][[2]], model[["terms"]][[1]], paste(base::attr(model[["terms"]],"intercept"), paste(ModelTerms, sep = " + "), sep = " + ")) ;

  NewResult <- stats::lm(NewFormula, data = data) ;

  return(NewResult)

}
