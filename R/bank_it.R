#' Bank It
#'
#' Helper for \code{bank_df()}.
#'
#'  ATTENTION: function index is unstable (excel vs. csv file source). Always
#'  check for correct behavior after usage!
#'
#'  --> maybe convert input into a tibble with as_tibble
#'
#' @param vect vector/list? of values to be adbanked
#' @param adbank adbank value
#'
#' @return vector of adbanked values
#' @export
#'
bank_it <- function(vect, adbank) {

  ## 20.07.21: now it creates a new index-error, when used in bank_df and a normal df is entered in the function
  vect <- vect[[1]]

  sto <- 0

  adb <- vector(mode = "double", length = length(vect))

  for (a in 1:length(vect)) {

    sto <- ((vect[a] * (adbank/100)) + (sto[[1]] * (1 - (adbank/100))))

    adb[a] <- sto

  }


  return(adb)

}
