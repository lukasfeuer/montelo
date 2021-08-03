#' MMM Template
#'
#' Generates a .R-file with the basic code structure and dependencies for MMM.
#'
#' Default library for model functions is montelo
#'
#' @param path string, optional path to save the file to, default is current wd
#' @param filename string for the file name e.g. "myModelFile" - no file extension
#'
#' @return Generates a .R-file with a template for MMM-Modeling
#' @export
#'
#'
mmm_template <- function(path = NULL, filename = "mmm_template") {

  if (!is.null(path)) {
    setwd(path)
    }

  fileConn<-file(paste0(filename, ".R"))
  writeLines(c(
"#===============================================================================:
# Model | Project ----
#===============================================================================:

# Modellzeitraum: xxxx bis xxxx

{
  RequiredPackages <- c('tidyverse',
                      'lubridate',
                      'hexView',
                      'tsibble',
                      'broom',
                      'prophet',
                      'dplyr',
                      'maRketingscience',
                      'dygraphs',
                      'xts',
                      'readxl',
                      'montelo'); lapply(RequiredPackages,
                                         require,
                                         character.only = TRUE)


  getwd()
  path <- dirname(rstudioapi::getSourceEditorContext()$path)
  setwd(path)
  getwd()

  options(scipen=50)
  #options(digits=3)

  #rm(list=ls())
}



# Data Screening ---------------------------------------------------------------


#daten_namen <- colnames(read_excel('../../path to data.xlsx', n_max = 1)) # --> in case, some rows should be skipped
daten <- read_excel('path/to/data_2021_07_28.xlsx')#, skip = 53, col_names = TRUE)
#colnames(daten) <- daten_namen


## NAs in Data
length(which(is.na(daten) == TRUE))


summary(daten)

#daten[,1] <- as.Date(daten[,1], format = '%d.%m.%Y')

time_series <- daten[,1]
summary(time_series)

codes <- names(daten)
anyDuplicated(codes)

codes



# Processing | AdBank & Log ----------------------------------------------------


## Funktionalität von bank_df() immer manuell überprüfen!
daten_adbanked <- bank_df(daten[, -c(1:154)])

daten_adbanked_log <- log_suffix(daten_adbanked)

daten <- cbind(daten, daten_adbanked, daten_adbanked_log)



#===============================================================================:
# 1 | Modellname ----
#===============================================================================:

## Zuweisung hilfreich, da model_painter() und mmm_plot eine Variable 'av' erwartet
av <- daten$modell_AV


dygraph(xts(x = av, order.by = time_series[[1]]))%>% # sometimes other index for time_series
  dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, drawGrid = FALSE, colors='#216ead') %>%
dyRangeSelector() %>%
  dyCrosshair(direction = 'vertical')




'
Altes Modeld:
 1 + Auto_Dummy
   +
'



### Model | Best Bet -----------------------------------------------------------




### Model | At Work ------------------------------------------------------------

#load('daten_m1.RData')

m1 <- lm(daten$modell_AV ~ 1
         #+ Sinus_Saison
         #+ Auto_Dummy1


         , data = daten
);summary(m1); model_stats(m1); mmm_plot(m1, av, time_series[[1]])

#daten$Auto_Dummy1 <- dummynate(m1)

# preview(m1)

p_check(varGroup = 'KW',
        vergl = TRUE,
        model = m1,
        data = daten)


grep('KW', codes, value = TRUE)

## Save model-specific data
# save(m1, daten, file = 'daten_m1.RData')



### Notes -----



# Functions --------------------------------------------------------------------

# attr(m1$terms, 'term.labels') --> codes irgendwie danach filtern

# compare_season(m1, daten, 8.304)

## Set Season for ad-hoc modeling
# daten$Sinus_Saison <- seasonate(daten, av, 45)

# show_sd(m1)

# maRketingscience::preview(m1)



"), fileConn)
  close(fileConn)
}
