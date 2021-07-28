#' Seasonate
#'
#' Creates a vector which can mimic the season function of of the modeling
#' suite by Prof. Dr. Alexander Preuss for comparability and reproduction of
#' models
#'
#' @param x data frame
#' @param av AV
#' @param index Index in \code{sin((ZAEHLER[k]+index)/NENNER)}
#'
#' @return vector
#' @export
#'
#'
seasonate <- function(x, av, index) {

  NENNER <- 8.30425020
  loop_len = 51

  ZAEHLER <- c(1:nrow(x))


  for (k in 1:nrow(x)) {

    x$Sinus_Saison[k] <- sin((ZAEHLER[k]+index)/NENNER)

  }

  return(x$Sinus_Saison)

}
