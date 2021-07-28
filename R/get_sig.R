#' Get p-value
#'
#' Extracts the p-value of a variable from a model
#'
#' @param model model object
#' @param var string, variable name
#'
#' @return
#' @export
#'
#'
get_sig <- function(model, var) {

  model_summary <- summary(model)

  var_sig <- model_summary[["coefficients"]][,"Pr(>|t|)"][var]

  return(var_sig)

}
