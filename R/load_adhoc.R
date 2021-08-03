#' Load Ad-hoc MMM Files
#'
#' @param MatrixA .MXA data file from ad-hoc modeling-script
#' @param Modellgleichung .mgl model file from ad-hoc modeling-script
#'
#' @return prints out a summary of the model and exports data as "daten"and the variables: time_series, av, zielvar, modellvar, warnings_notFound, warnings_noVariance
#' @export
#'
#'
load_adhoc <- function(MatrixA, Modellgleichung) {


  load(file = MatrixA)
  ## läd: A (data.frame), zielv (data.frame), matrix_a_namen, sin_schleife, sin_teiler, zielvar

  # Benötigt Matrix A in Environment

  load(file = Modellgleichung)
  ## läd modellvar und dummy_sicherung


  if (exists("dummy_sicherung")) {

    A$Dummy <- dummy_sicherung

  }


  warnings_notFound <- list()

  for (n in length(modellvar):1) {

    if (modellvar[n] %in% colnames(A) == FALSE) {

      warnings_notFound[n] <- paste("Die Variable", modellvar[n], "ist nicht vorhanden und wird entfernt.")

      modellvar <- modellvar[-n]

    }

  }

  warnings_noVariance <- list()

  for (n in 1:length(modellvar)) {

    if ((stats::var(A[modellvar[n]]) == 0) & (modellvar[n] != "Konstante")) {

      warnings_noVariance[n] <- paste("Achtung! Die Variable",modellvar[n],"hat keine Varianz. (Spalte",n,")")


    }
  }


  daten <<- A
  time_series <<- tibble::tibble(Date = A[,1])
  av <<- zielv[[1]]
  zielvar <<- zielvar
  modellvar <<- modellvar
  warnings_notFound <<- warnings_notFound
  warnings_noVariance <<- warnings_noVariance


  return(message(writeLines(c( paste0(rep("=", 45), collapse = ""),
                               paste("Ad-hoc MMM für", zielvar),
                               paste0(rep("=", 45), collapse = ""),
                               paste("Sinusschleife =", sin_schleife),
                               paste("Sinus Teiler=", sin_teiler),
                               paste0(rep("-", 45), collapse = ""),
                               paste("Modellgleichung:"),
                               paste(modellvar, collapse = " + "),
                               paste0(rep("-", 45), collapse = ""))
                            )
                 )
         )
}
