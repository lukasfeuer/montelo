#' AdBank Data Frame
#'
#' Creates all AdBanks in \code{c(seq(1:9), seq(from= 10, to = 90, by = 10))} for
#' a given data frame.
#'
#'  ATTENTION: function index is unstable (excel vs. csv file source). Always
#'  check for correct behavior after usage!
#'  --> Malfunction might be attributed to bank_it function
#'
#' @param DF data.frame to be adbanked
#'
#' @return
#' @export
#'
#'
bank_df <- function(DF) {


  DF_names <- colnames(DF)

  ## If functions runs stable, enable the option to supply individual adbank-steps
  adbank_steps <- c(seq(1:9), seq(from= 10, to = 90, by = 10))

  bank_all_var <- list()


  for (spalte in 1:ncol(DF)) {

    var_name <- DF_names[spalte]

    var_data <- DF[, spalte]

    bank_one_var <- list()



    for (a in 1:length(adbank_steps)) {

      temp_adbank_var <- bank_it(var_data, adbank_steps[a])

      bank_one_var[[a]] <- data.frame(temp_adbank_var)

    }

    adbank_steps_chr <- as.character(adbank_steps)

    for (ding in 1:length(adbank_steps_chr)) {
      ifelse((nchar(adbank_steps_chr[ding]) == 1),
             (adbank_steps_chr[ding] = paste0("0", adbank_steps_chr[ding])),
             (adbank_steps_chr[ding] = adbank_steps_chr[ding]))
    }

    names_one_var <- lapply(adbank_steps_chr, function (x) {paste(var_name, x, sep = "_")} )

    bank_one_var <- data.frame(bank_one_var)

    colnames(bank_one_var) <- names_one_var

    bank_all_var[[spalte]] <- data.frame(bank_one_var)


  }

  bank_all_var <- do.call(cbind, bank_all_var)

  return(bank_all_var)

}
