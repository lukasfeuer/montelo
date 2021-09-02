#' Save Ad-hoc
#'
#' Save model files and data in a format needed for use in ad-hoc modeling script
#'
#' Maybe in the future, rearrange the dataset, so that the second column contains the av, because the script expects this to be the av. As of now, be aware to change the av if the adhoc script is used
#'
#' @param daten data.frame of the data
#' @param model model object
#' @param av_name string, name of the dependet variable
#' @param sin_schleife length of sin loop, default = 51
#' @param sin_teiler constant, default = 8.3042502 for weekly data
#'
#' @return none, saves two files to current wd
#' @export
#'

save_adhoc <- function(daten,
                       model,
                       av_name,
                       sin_schleife = 51,
                       sin_teiler = 8.3042502) {

  #Save Matrix



  A <- daten

  zielv_temp <- data.frame(zielv_temp_daten = daten[, av_name])
  colnames(zielv_temp) <- av_name
  zielv <- zielv_temp

  matrix_a_namen <- colnames(daten)

  sin_schleife <- sin_schleife

  sin_teiler <- sin_teiler

  zielvar <- av_name

  # if Bug: maybe adjust sequence of list objects to: c("A","zielvar","zielv","sin_teiler","sin_schleife","matrix_a_namen")
  save(file=paste0("Ad_hoc_Matrix_",
                   format(Sys.time(), "%Y_%m_%d_%H%M%S"),".MXA"), list=c("A","zielvar","zielv","sin_teiler","sin_schleife","matrix_a_namen"))


  # Save Model Equation

  # necessary? seems to be always empty
  #mgl$dummy_sicherung <- list("vector")

  modellvar <- attr(model$terms, "term.labels") # Maybe the user has to name the Dummy "Auto_Dummy" and not a custom name

  save(file=paste0("Ad_hoc_Modellgleichung_",
                   format(Sys.time(), "%Y_%m_%d_%H%M%S"),".mgl"), list="modellvar")

}
