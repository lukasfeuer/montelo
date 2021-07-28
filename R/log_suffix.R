#' Log Suffix
#'
#' Modified \code{logger()} function (by B. Kreutzer, see package maRketingscience)
#' to add a "_log" suffix instead of a prefix to better match other functions in
#' montelo and byndmodfun packages.
#'
#' @param x data frame to log
#'
#' @return data frame of logged values
#' @export
#'
#'
log_suffix <- function (x) {
  y <- x %>% purrr::map_df(., ~log(.x + 1))
  names(y) <- paste0(names(x), "_log")
  return(y)
}
