#' Dummynate
#'
#' For demonstration only. DO NOT USE!
#'
#' Dummynate a given model (like dominate, get it?... get it?...) by setting a
#' multi-step Dummy based on std. residuals.
#'
#' @param model model object
#'
#' @return vector of integers
#' @export
#'
#'
dummynate <- function(model) {

  resid <- model$residuals

  sd_resid <- stats::sd(model$residuals)

  dummy <- c(rep(0,times=length(resid)))

  for (i in 1:length(resid)) {

    if (resid[i] > sd_resid) {

      dummy[i] <- round(resid[i] / sd_resid, 0)

    }

    if (resid[i] < sd_resid * -1) {

      dummy[i] <- round(resid[i] / sd_resid, 0)

    }

  }

  return(dummy)

}
