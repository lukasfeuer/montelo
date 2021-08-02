#' Find optimal Season
#'
#' Finds the constant for the best fitting sin-curve for a given AV. Mimics the
#' season function of of the modeling suite by Prof. Dr. Alexander Preuss for
#' comparability and reproduction of models. --- assumes weekly data
#'
#' @param x data frame
#' @param av vector defining the AV
#'
#' @return list with a vector for Sinus_Saison and the value of the constant used
#' @export
#'

seasonate_optimize <- function(x, av) {


  NENNER <- 8.30425020
  loop_len = 51

  saison_max <- 0
  cor_max <- 0
  saison_var <- c(1:nrow(x))

  for (j in 1:loop_len) {

    for (k in 1:nrow(x)) {

      x$Sinus_Saison[k] <- sin((saison_var[k]+j)/NENNER)

    }

    sin_cor <- abs(cor(av,x$Sinus_Saison))

    if (sin_cor > cor_max) {

      saison_max <- j
      cor_max <- sin_cor

    }


  }



  for (k in 1:nrow(x)) {

    x$Sinus_Saison[k] <- sin((saison_var[k]+saison_max)/NENNER)

  }

  output <- list(x$Sinus_Saison, paste("Saison Optimum bei: ", saison_max))

  return(output)

}
