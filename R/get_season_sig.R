#' Extract p-Value for Season Variable
#'
#' Helper for find_season()
#'
#' @param model model object
#' @param var string
#'
#' @return
#' @export
#'
#'
get_season_sig <- function(model, var) {

  model_summary <- summary(model)

  ## alternetive intexing of signif. values. The term we want ist always the last one
  len_t <- length(model_summary[["coefficients"]][,"Pr(>|t|)"])

  var_sig <- model_summary[["coefficients"]][,"Pr(>|t|)"][len_t]

  return(var_sig)

}
