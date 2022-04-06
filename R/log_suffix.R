#' Log Suffix
#'
#' @param x data frame to log
#'
#' @return data frame of logged values
#' @export
#'
#'
log_suffix <- function (x) {
  y <- x %>% purrr::map_df(., ~log(. + 1))
  names(y) <- paste0(names(x), "_log")
  return(y)
}
